class Volun::Availability < ActiveRecord::Base

  enum day: { monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6, sunday:7 }

  belongs_to :volunteer

  validates :volunteer_id, :day, presence: true
  
  def to_s
    day_i18n
  end

end
