class Volunteer < ActiveRecord::Base

  include Archivable
  include VirtualFullName

  enum gender: [:male, :female]

  belongs_to :academic_level
  belongs_to :address #required: true
  belongs_to :id_number_type, required: true
  belongs_to :employment_status
  belongs_to :info_source
  belongs_to :nationality
  belongs_to :profession
  belongs_to :status
  belongs_to :manager
  belongs_to :unsubscribe_reason
  has_and_belongs_to_many :projects,        ->{ where(active: true).order('projects.name asc') }
  has_and_belongs_to_many :projects_others, ->{ where(active: true).order('projects.name asc') }, class_name: 'Project'
  has_and_belongs_to_many :skills,          ->{ where(active: true).order('skills.name asc') }
  has_and_belongs_to_many :degrees,         ->{ where(active: true).order('degrees.name asc') }
  has_and_belongs_to_many :areas,           ->{ where(active: true).order('areas.name asc') }
  has_and_belongs_to_many :collectives,     ->{ where(active: true).order('collectives.name asc') }
  has_many :availabilities, ->{ ordered }, class_name: 'Volun::Availability'
  has_many :known_languages,      class_name: 'Volun::KnownLanguage'
  has_many :assessments,          class_name: 'Volun::Assessment'
  has_many :assessments_projects, class_name: 'Volun::AssessmentsProject'
  has_many :contacts,             class_name: 'Volun::Contact'
  has_many :trackings,            class_name: 'Volun::Tracking'
  has_many :languages, :through => :known_languages
  has_many :traits,    :through => :assessments
  has_many :links, as: :linkable
  has_many :images, -> { volunteer_images }, class_name: 'Link', foreign_key: 'linkable_id'
  has_many :videos, -> { volunteer_videos }, class_name: 'Link', foreign_key: 'linkable_id'
  has_many :docs,   -> { volunteer_docs   }, class_name: 'Link', foreign_key: 'linkable_id'
  has_many :urls,   -> { volunteer_urls   }, class_name: 'Link', foreign_key: 'linkable_id'
  has_one  :logo,   -> { volunteer_logo   }, class_name: 'Link', foreign_key: 'linkable_id'
  has_one  :user, as: :loggable

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :degrees,              reject_if: :check_existing, allow_destroy: true
  accepts_nested_attributes_for :availabilities,       reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :known_languages,      reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :assessments,          reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :assessments_projects, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :projects,             reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :images,               reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :videos,               reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :docs,                 reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :urls,                 reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :logo,                 reject_if: :all_blank, allow_destroy: true

  validates :name, :last_name, :id_number, presence: true
  validates :id_number, spanish_vat: true
  validates :phone_number, format: { with: /[6|7|8|9]\d{8}/ }, allow_blank: true
  validates :phone_number_alt, format: { with: /[6|7|8|9]\d{8}/ }, allow_blank: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, allow_blank: true
  validates :birth_date, date: { after:       Proc.new { 150.years.ago },
                                 before:      Proc.new { Date.yesterday },
                                 message:     I18n.t('activerecord.errors.messages.invalid_volun_birth_date'),
                                 allow_blank: true }
  validates :availability_date, date: { after:       Proc.new { Date.tomorrow },
                                        before:      Proc.new { 150.years.since },
                                        message:     I18n.t('activerecord.errors.messages.invalid_volun_availability_date'),
                                        allow_blank: true },
                                unless: 'available?'
  validates :agreement_date, presence: { message: I18n.t('activerecord.errors.messages.invalid_volun_agreement_date')},
                             if: 'agreement?'
  validates :subscribe_date, date: { after:       Proc.new { 150.years.ago },
                                     before:      Proc.new { 150.years.since },
                                     message:     I18n.t('activerecord.errors.messages.invalid_volun_subscribe_dates'),
                                     allow_blank: true }
  validates :unsubscribe_date, date: { after:       Proc.new { 150.years.ago },
                                       before:      Proc.new { 150.years.since },
                                       message:     I18n.t('activerecord.errors.messages.invalid_volun_subscribe_dates'),
                                       allow_blank: true }
  scope :all_active,   ->(){ where(active: true) }
  scope :all_inactive, ->(){ where(active: false) }
  scope :all_active,   ->(){ where(active: true) }
  scope :all_inactive, ->(){ where(active: false) }
  scope :with_status, ->(status){
    if status.to_s.in? %w(active inactive)
      public_send("all_#{status}")
    else
      all
    end
  }

  def self.main_columns
    %i(id
       id_number
       name
       last_name
       last_name_alt
       phone_number
       phone_number_alt)
  end

  def self.ransack_default
    {s: 'id asc'}
  end

  def to_s
    name
  end

  def unassociated_projects
    Project.where('id NOT IN (?)', self.projects.select('id')).where(active: true).order('projects.name asc')
  end

  def check_existing(degree_attr)
    _degree = Degree.find_by(name: degree_attr[:name])
    if _degree && !self.degrees.exists?(_degree)
      self.degrees << _degree
    end
    return true
  end

  def mobile_number
    if phone_number && phone_number.start_with?("6"||"7")
      phone_number
    elsif phone_number_alt && phone_number_alt.start_with?("6"||"7")
      phone_number_alt
    end
  end

end
