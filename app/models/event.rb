class Event < ActiveRecord::Base

  belongs_to :eventable, polymorphic: true #, required: true
  belongs_to :address, required: true
  has_many :timetables, :dependent => :destroy

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :timetables, reject_if: :all_blank, allow_destroy: true

  validate :at_least_one_timetable

  private

  def at_least_one_timetable
    unless timetables.reject(&:marked_for_destruction?).count >= 1
      errors.add(:base, :one_timetable_at_least)
      if timetables.any?
        timetables.first.reload if timetables.first.marked_for_destruction?
      end
    end
  end

end
