class Timetable < ActiveRecord::Base

  enum day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  belongs_to :project


end
