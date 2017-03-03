class Volun::Availability < ActiveRecord::Base

  enum day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  belongs_to :volunteer

  validates :volunteer_id, :day, presence: true
  
  def to_s
    day_i18n
  end

end
