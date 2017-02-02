class Collective < ActiveRecord::Base
  
  include Recordable
  include Archivable

  has_and_belongs_to_many :projects

  validates :name, uniqueness: true
  validates :name, presence: true


  def to_s
    name
  end

end
