class Project < ActiveRecord::Base

  include Archivable

  belongs_to :project_type, required: true
  belongs_to :entity
  has_and_belongs_to_many :addresses
  has_and_belongs_to_many :timetables
  # TODO make these associations updatable from form
  has_and_belongs_to_many :areas, -> { order('areas.name asc') }
  has_and_belongs_to_many :collectives, -> { order('collectives.name asc') }
  has_and_belongs_to_many :coordinations, -> { order('coordinations.name asc') }
  has_and_belongs_to_many :districts, -> { order('districts.name asc') }
  # END TODO
  has_many :documents
  has_many :timetables
  has_one :project_type_subvention
  has_one :project_type_entity
  has_one :project_type_centre
  has_one :project_type_permanent
  has_one :project_type_punctual
  has_one :project_type_social
  has_one :project_type_other

  accepts_nested_attributes_for :timetables, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :addresses,  allow_destroy: true, reject_if: :all_blank

  validates :name, uniqueness: true
  validates :name, presence: true

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

  def detailed_project
    public_send "project_type_#{project_type.kind}" # rescue nil
  end

end
