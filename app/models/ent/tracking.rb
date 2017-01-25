class Ent::Tracking < ActiveRecord::Base

  belongs_to :tracking_type
  belongs_to :entity
  belongs_to :manager

  validates :tracking_type_id, :entity_id, :tracked_at, presence: true

end
