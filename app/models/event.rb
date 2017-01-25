class Event < ActiveRecord::Base

  belongs_to :eventable, polymorphic: true
  belongs_to :address
  has_many :timetables

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :timetables

  validates :address_id, :eventable_id, :eventable_type, presence: true

end
