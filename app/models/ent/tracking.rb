class Ent::Tracking < ActiveRecord::Base

  belongs_to :tracking_type, required: true
  belongs_to :entity, required: true
  belongs_to :manager
  belongs_to :request_form

  validates :tracked_at, presence: true

end
