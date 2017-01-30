class ContactResult < ActiveRecord::Base

  include Archivable

  has_many :contacts, :class_name => 'Volun::Contact'
  has_many :volunteers, :through => :contacts

  validates :name, uniqueness: true
  validates :name, presence: true

  def to_s
    name
  end

end
