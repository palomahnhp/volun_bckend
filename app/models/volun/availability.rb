class Volun::Availability < ActiveRecord::Base

  belongs_to :volunteer

  validates :volunteer_id, :day, presence: true

end
