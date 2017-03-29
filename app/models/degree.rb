class Degree < ActiveRecord::Base

  include Recordable
  include Archivable

  belongs_to :degree_type
  
  scope :filter_by_degree_type, ->(dt_id){ where(active: true).joins(:degree_type).where("degree_types.id = ?", dt_id) }

  validates :name, uniqueness: true
  validates :name, :degree_type, presence: true
  
  def self.main_columns
    %i(degree_type name active)
  end

  def to_s
    name
  end

end
