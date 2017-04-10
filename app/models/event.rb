class Event < ActiveRecord::Base

  belongs_to :eventable, polymorphic: true #, required: true
  belongs_to :address, required: true
  has_many :timetables, -> { order('timetables.execution_date asc') }, :dependent => :destroy
  belongs_to :project,  -> { includes(:events).where(events: { eventable_type: Project.name  }) }, foreign_key: 'eventable_id'
  belongs_to :activity, -> { includes(:events).where(events: { eventable_type: Activity.name }) }, foreign_key: 'eventable_id'

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :timetables, reject_if: :all_blank, allow_destroy: true

end
