class Event < ActiveRecord::Base

  belongs_to :eventable, polymorphic: true #, required: true
  belongs_to :address, required: true
  has_many :timetables

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :timetables, reject_if: :all_blank

end
