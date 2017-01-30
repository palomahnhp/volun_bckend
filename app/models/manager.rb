class Manager < ActiveRecord::Base

  include Archivable

  has_many :contacts, :class_name => 'Volun::Contact'
  has_many :trackings, :class_name => 'Volun::Tracking'

  validates :name, uniqueness: true
  validates :name, presence: true

  def to_s
    name
  end

end
