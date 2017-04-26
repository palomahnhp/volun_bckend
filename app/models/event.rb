class Event < ActiveRecord::Base

  belongs_to :eventable, polymorphic: true #, required: true
  belongs_to :address, required: true
  has_many :timetables, -> { order('timetables.execution_date asc, timetables.start_hour asc') }, :dependent => :destroy
  belongs_to :project,  -> { includes(:events).where(events: { eventable_type: Project.name  }) }, foreign_key: 'eventable_id'
  belongs_to :activity, -> { includes(:events).where(events: { eventable_type: Activity.name }) }, foreign_key: 'eventable_id'

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :timetables, reject_if: :all_blank, allow_destroy: true

  validate :timetables_unique

  private

  def timetables_unique
    return unless timetables.any?
    validation = true
    timetables.each do |first_timetable|
      timetables_count = 0
      timetables.each do |timetable|
        if first_timetable.execution_date == timetable.execution_date && first_timetable.start_hour == timetable.start_hour && first_timetable.end_hour == timetable.end_hour
          timetables_count += 1
        end
      end
      if timetables_count > 1
        errors.add(:base, :timetables_must_be_unique_in_events)
        return
      end
    end
  end

end
