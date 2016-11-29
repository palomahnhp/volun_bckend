class Timetable < ActiveRecord::Base

  enum day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  has_and_belongs_to_many :projects

  validates :day, :start_hour, :end_hour, presence: true
  validates :start_hour, :end_hour, format: { with: /\A(?:(([01][0-9])|(2[0-4])):([0-5][0-9]))\z/ }
  validate :start_hour_less_than_end_hour


  private

  def start_hour_less_than_end_hour
    return unless start_hour && end_hour

    unless start_hour < end_hour
      errors.add(:start_hour, :start_hour_must_be_less_than_end_hour)
    end
  end


end
