class Volun::Availability < ActiveRecord::Base

  enum day: { monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6, sunday:7 }

  belongs_to :volunteer

  validates :day, presence: true

  def to_s
    day_i18n
  end

  def self.days_i18n_alt
    days_i18n.inject({}) do |days_i18n_alt, (day, day_i18n)|
      days_i18n_alt.merge(day_i18n =>  days[day])
    end
  end

end
