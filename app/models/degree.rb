class Degree < ActiveRecord::Base

  include Recordable
  include Archivable

  belongs_to :degree_type
  
  scope :filter_by_degree_type, ->(dt_id){ where(active: true, degree_type_id: dt_id) }

  validates :name, uniqueness: true
  validates :name, :degree_type, presence: true

  def to_s
    name
  end

end
