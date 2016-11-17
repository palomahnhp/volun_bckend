class Project < ActiveRecord::Base

  include Archivable

  belongs_to :project_type
  belongs_to :entity
  has_and_belongs_to_many :addresses
  has_and_belongs_to_many :timetables
  has_and_belongs_to_many :areas
  has_and_belongs_to_many :collectives
  has_and_belongs_to_many :coordinations
  has_and_belongs_to_many :districts
  has_one :project_type_subvention
  has_many :documents
  has_many :timetables

  accepts_nested_attributes_for :timetables, allow_destroy: true
  accepts_nested_attributes_for :addresses,  allow_destroy: true

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

end
