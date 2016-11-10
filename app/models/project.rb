class Project < ActiveRecord::Base
  include Archivable

  belongs_to :project_type
  belongs_to :entity
  has_and_belongs_to_many :addresses
  has_and_belongs_to_many :areas
  has_and_belongs_to_many :collectives
  has_and_belongs_to_many :coordinations
  has_and_belongs_to_many :districts

  validates :name, uniqueness: true

  def self.main_columns
    %i(id name project_type entity execution_start_date
       execution_end_date volunteers_num beneficiaries_num)
  end

  def to_s
    name
  end

end
