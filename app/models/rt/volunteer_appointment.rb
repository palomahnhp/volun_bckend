class Rt::VolunteerAppointment < ActiveRecord::Base

  include RtModel

  belongs_to :volunteer


end
