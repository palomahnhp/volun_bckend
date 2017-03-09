class Ent::Tracking < ActiveRecord::Base

  belongs_to :tracking_type # required: true
  belongs_to :entity # required: true
  belongs_to :manager
  belongs_to :request_form

  validates :entity_id, :tracking_type_id, :tracked_at, presence: true
  
  def self.main_columns
    %i(entity tracking_type manager request_form tracked_at automatic comments)
  end

end
