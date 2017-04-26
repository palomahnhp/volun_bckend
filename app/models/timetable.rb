class Timetable < ActiveRecord::Base

  belongs_to :event #, required: true

  # validates :execution_date, :start_hour, :end_hour, presence: true
  validates :execution_date, inclusion: { in: (11.months.ago..11.months.since),
                                                message: I18n.t('activerecord.errors.messages.invalid_proj_date')}
  validates :start_hour, format: { with: /\A(?:(([01][0-9])|(2[0-4])):([0-5][0-9]))\z/ }, allow_blank: true, unless: :start_hour_blank_mask
  validates :end_hour, format: { with: /\A(?:(([01][0-9])|(2[0-4])):([0-5][0-9]))\z/ }, allow_blank: true, unless: :end_hour_blank_mask
  validate  :start_hour_less_than_end_hour, if: 'start_hour? && end_hour?', unless: :start_hour_blank_mask


  private

  def start_hour_less_than_end_hour
    return unless start_hour && end_hour

    unless start_hour < end_hour
      errors.add(:start_hour, :start_hour_must_be_less_than_end_hour)
    end
  end

  def start_hour_blank_mask
    avoid_time_mask(start_hour)
  end

  def end_hour_blank_mask
    avoid_time_mask(end_hour)
  end

  def avoid_time_mask(time)
    time == "__:__"
  end

end
