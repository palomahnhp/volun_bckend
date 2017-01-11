class Rt::VolunteerAppointment < ActiveRecord::Base

  include RtCommons

  belongs_to :volunteer


end
