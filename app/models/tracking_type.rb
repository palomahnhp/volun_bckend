class TrackingType < ActiveRecord::Base

  include Archivable

  has_many :trackings, :class_name => 'Volun::Tracking'

  validates :name, uniqueness: true
  validates :name, :active, presence: true

  def to_s
    name
  end

end
