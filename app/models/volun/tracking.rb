class Volun::Tracking < ActiveRecord::Base

  belongs_to :volunteer
  belongs_to :tracking_type
  belongs_to :project
  belongs_to :technician

  validates :volunteer_id, :tracking_type_id, :tracking_date, presence: true


end
