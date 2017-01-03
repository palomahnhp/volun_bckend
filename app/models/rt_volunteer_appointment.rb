class RtVolunteerAppointment < ActiveRecord::Base

  belongs_to :volunteer
  has_one :request_form, as: :rt_extendable

end
