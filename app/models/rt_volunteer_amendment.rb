class RtVolunteerAmendment < ActiveRecord::Base

  belongs_to :volunteer
  belongs_to :address
  has_one :request_form, as: :rt_extendable

end
