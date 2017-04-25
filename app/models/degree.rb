class Degree < ActiveRecord::Base

  include Recordable
  include Archivable

  belongs_to :degree_type
  has_and_belongs_to_many :volunteers
  
  scope :filter_by_degree_type_id, ->(dt_id){ where(active: true).joins(:degree_type).where("degree_types.id = ?", dt_id) }
  scope :filter_by_degree_type_name, ->(dt_name){ where(active: true).joins(:degree_type).where("degree_types.name = ?", dt_name) }

  validates :name, uniqueness: true
  validates :name, :degree_type, presence: true
  
  def self.main_columns
    %i(degree_type name active)
  end

  def to_s
    name
  end

end
