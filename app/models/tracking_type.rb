class TrackingType < ActiveRecord::Base

  include Recordable
  include Archivable

  has_many :trackings, :class_name => 'Volun::Tracking'

  validates :name, uniqueness: true
  validates :name, presence: true

  # TODO set the definitive tracking type
  def self.get_volunteer_subscribe_type
    first
  end

  def to_s
    name
  end

end
