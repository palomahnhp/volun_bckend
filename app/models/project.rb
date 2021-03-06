class Project < ActiveRecord::Base

  include Archivable

  belongs_to :pt_extendable, polymorphic: true
  belongs_to :project_type, required: true
  belongs_to :entity, -> { where(active: true).order('entities.name asc') }, required: true
  has_and_belongs_to_many :volunteers
  has_and_belongs_to_many :areas, -> { where(active: true).order('areas.name asc') }
  has_and_belongs_to_many :inactive_areas, -> { where(active: false).order('areas.name asc') }, class_name: 'Area'
  has_and_belongs_to_many :collectives, -> { where(active: true).order('collectives.name asc') }
  has_and_belongs_to_many :inactive_collectives, -> { where(active: false).order('collectives.name asc') }, class_name: 'Collective'
  has_and_belongs_to_many :coordinations, -> { where(active: true).order('coordinations.name asc') }
  has_and_belongs_to_many :inactive_coordinations, -> { where(active: false).order('coordinations.name asc') }, class_name: 'Coordination'
  has_many :documents
  has_many :activities
  has_many :events, as: :eventable
  has_many :addresses, through: :events
  has_many :trackings,         :class_name => 'Pro::Tracking'
  has_many :volun_trackings,   :class_name => 'Volun::Tracking'
  has_many :volun_contacts,    :class_name => 'Volun::Contact'
  has_many :volun_assessments, :class_name => 'Volun::Assessments'
  has_many :links, as: :linkable
  has_one  :logo,   -> { project_logo   }, class_name: 'Link', foreign_key: 'linkable_id'
  has_many :images, -> { project_images }, class_name: 'Link', foreign_key: 'linkable_id'
  has_many :videos, -> { project_videos }, class_name: 'Link', foreign_key: 'linkable_id'
  has_many :docs,   -> { project_docs   }, class_name: 'Link', foreign_key: 'linkable_id'
  has_many :urls,   -> { project_urls   }, class_name: 'Link', foreign_key: 'linkable_id'

  accepts_nested_attributes_for :documents,  allow_destroy: true
  accepts_nested_attributes_for :pt_extendable
  accepts_nested_attributes_for :events, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :videos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :docs,   reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :urls,   reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :logo,   reject_if: :all_blank, allow_destroy: true

  validates :name, uniqueness: true
  validates :name, :description, :contact_name, :contact_last_name, :execution_start_date,
            :phone_number, :email, :project_type_id, :entity_id, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validate  :execution_start_date_less_than_execution_end_date
  validates :execution_start_date, inclusion: { in: (11.months.ago..11.months.since),
                                                message: I18n.t('activerecord.errors.messages.invalid_proj_date')}
  validates :execution_end_date, inclusion: { in: (11.months.ago..11.months.since),
                                              message: I18n.t('activerecord.errors.messages.invalid_proj_date'),
                                              allow_blank: true }
  validates :insurance_date, date: { after:       Proc.new { Date.today },
                                     before:      Proc.new { 150.years.since },
                                     message:     I18n.t('activerecord.errors.messages.invalid_proj_insurance_date') },
                             if: 'insured?'
  validates :volunteers_num, :beneficiaries_num, numericality: { allow_blank: true }
  validate  :check_timetables_execution_date

  scope :list, ->(){
    includes(
      :pt_extendable,
      :project_type,
      :entity,
      :areas,
      :collectives,
      :addresses
    )
  }
  scope :all_active,   ->(){ where(active: true) }
  scope :all_inactive, ->(){ where(active: false) }
  scope :with_status, ->(status){
    if status.to_s.in? %w(active inactive)
      public_send("all_#{status}")
    else
      all
    end
  }
  scope :urgent_projects, ->(){ where(urgent: true) }
  scope :outstanding_projects, ->(){ where(outstanding: true) }

  def self.main_columns
    %i(
      id
      name
      project_type
      entity
      execution_start_date
      execution_end_date
      volunteers_num
      beneficiaries_num
    )
  end

  def self.ransack_default
    {s: 'id desc'}
  end

  def self.to_csv(projects)
    CSV.generate(col_sep:';', encoding:'ISO-8859-1') do |csv|
      csv << main_columns.map{ |column_name| human_attribute_name(column_name) } + [Address.human_attribute_name(:district).pluralize, Area.model_name.human(count: 2), Collective.model_name.human(count: 2)]
      projects.each do |project|
        csv << main_columns.map{ |column_name| project.public_send column_name } + [project.addresses.pluck(:district).to_sentence, project.areas.to_sentence, project.collectives.to_sentence]
      end
    end
  end

  def to_s
    name
  end

  def build_pt_extendable(attributes = {})
    return unless project_type.extendable?
    self.pt_extendable = pt_extendable_class.new(attributes.merge(project: self))
  end

  private

  def execution_start_date_less_than_execution_end_date
    return unless execution_start_date && execution_end_date

    unless execution_start_date <= execution_end_date
      errors.add(:execution_start_date, :execution_start_date_must_be_less_than_execution_end_date)
    end
  end

  def check_timetables_execution_date
    return unless events.any?
    validation = true
    self.events.each do |event|
      event.timetables.each do |timetable|
        if timetable.execution_date?
          if execution_end_date?
            unless (timetable.execution_date >= execution_start_date) && (timetable.execution_date <= execution_end_date)
              validation = false
            end
          else
            unless (timetable.execution_date >= execution_start_date)
              validation = false
            end
          end
        end
        unless validation
          errors.add(:base, :timetable_must_be_between_execution_start_date_and_execution_end_date)
          return true
        end
      end
    end
  end

  def pt_extendable_class
    pt_extendable.try(:class) || project_type.kind.classify.sub(/\APt/, 'Pt::').constantize
  end

end
