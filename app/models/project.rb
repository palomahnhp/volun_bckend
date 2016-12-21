class Project < ActiveRecord::Base

  include Archivable

  belongs_to :pt_extendable, polymorphic: true
  belongs_to :project_type, required: true
  belongs_to :entity
  has_and_belongs_to_many :timetables
  has_and_belongs_to_many :areas, -> { order('areas.name asc') }
  has_and_belongs_to_many :collectives, -> { order('collectives.name asc') }
  has_and_belongs_to_many :coordinations, -> { order('coordinations.name asc') }
  has_and_belongs_to_many :districts, -> { order('districts.name asc') }
  has_many :documents
  has_many :activities
  has_many :events, as: :eventable

  accepts_nested_attributes_for :timetables, allow_destroy: true
  accepts_nested_attributes_for :documents,  allow_destroy: true
  accepts_nested_attributes_for :pt_extendable

  validates :name, uniqueness: true
  validates :name, :entity_id, :description, :execution_start_date, :contact_name,
            :phone_number, :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

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
    %i(id name project_type entity execution_start_date
       execution_end_date volunteers_num beneficiaries_num)
  end

  def self.ransack_default
    {s: 'id desc'}
  end

  def to_s
    name
  end

  def pt_extendable_class
    @pt_extendable_class ||= pt_extendable.try(:class) || project_type.kind.classify.constantize
  end

  def build_pt_extendable(pt_extension_kind)
    return unless pt_extension_kind.to_s.in? ProjectType.pt_extension_tables
    self.pt_extendable ||= pt_extendable_class.new
  end

end
