class Rt::VolunteerAmendment < ActiveRecord::Base

  include RtCommons

  belongs_to :volunteer
  belongs_to :address
  has_one :request_form, as: :rt_extendable

end
