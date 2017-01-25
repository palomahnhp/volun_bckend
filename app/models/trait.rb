class Trait < ActiveRecord::Base

  include Archivable

  has_many :assessments, :class_name => 'Volun::Assessment'
  has_many :volunteers, :through => :assessments

  validates :name, uniqueness: true
  validates :name, :active, presence: true

  def to_s
    name
  end

end
