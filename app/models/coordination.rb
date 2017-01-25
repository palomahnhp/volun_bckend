class Coordination < ActiveRecord::Base

  include Recordable
  include Archivable

  has_and_belongs_to_many :projects

  validates :name, uniqueness: true
  validates :name, :active, presence: true

  def self.main_columns
    [:id, :name, :active]
  end

  def to_s
    name
  end

end
