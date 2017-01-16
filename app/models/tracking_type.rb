class TrackingType < ActiveRecord::Base

  include Archivable

  has_many :trackings, :class_name => 'Volun::Tracking'


  def to_s
    name
  end

end
