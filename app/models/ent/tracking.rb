class Ent::Tracking < ActiveRecord::Base

  belongs_to :tracking_type
  belongs_to :entity
  belongs_to :manager


end
