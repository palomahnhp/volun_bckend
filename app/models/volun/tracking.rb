class Volun::Tracking < ActiveRecord::Base

  belongs_to :volunteer
  belongs_to :tracking_type
  belongs_to :project
  belongs_to :manager
  belongs_to :request_form

  validates :volunteer_id, :tracking_type_id, :tracked_at, presence: true


end
