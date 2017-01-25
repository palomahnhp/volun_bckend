class Skill < ActiveRecord::Base

  include Archivable

  has_and_belongs_to_many :volunteers

  validates :name, uniqueness: true
  validates :name, :active, presence: true

  def to_s
    name
  end

end
