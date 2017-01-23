class Technician < ActiveRecord::Base

  include Archivable

  has_many :contacts, :class_name => 'Volun::Contact'
  has_many :trackings, :class_name => 'Volun::Tracking'

  def to_s
    name
  end

end
