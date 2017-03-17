class Event < ActiveRecord::Base

  belongs_to :eventable, polymorphic: true #, required: true
  belongs_to :address, required: true
  has_many :timetables, :dependent => :destroy
  belongs_to :project,  -> { where(events: { eventable_type: Project.name  }) }, foreign_key: 'eventable_id'
  belongs_to :activity, -> { where(events: { eventable_type: Activity.name }) }, foreign_key: 'eventable_id'

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :timetables, reject_if: :all_blank, allow_destroy: true

end
