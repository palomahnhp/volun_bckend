class ContactResult < ActiveRecord::Base

  include Archivable

  has_many :contacts, :class_name => 'Volun::Contact'
  has_many :volunteers, :through => :contacts


  def to_s
    name
  end

end
