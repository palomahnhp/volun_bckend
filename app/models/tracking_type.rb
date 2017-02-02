class TrackingType < ActiveRecord::Base

  include Recordable
  include Archivable

  has_many :trackings, :class_name => 'Volun::Tracking'

  validates :name, uniqueness: true
  validates :name, presence: true

  def to_s
    name
  end

end
