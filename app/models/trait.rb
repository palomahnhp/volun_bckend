class Trait < ActiveRecord::Base

  include Archivable

  has_many :assessments, :class_name => 'Volun::Assessment'
  has_many :volunteers, :through => :assessments

  def to_s
    name
  end

end
