class RftVolunteerAmendment < ActiveRecord::Base

  belongs_to :request_form_type
  belongs_to :volunteer
  belongs_to :address


end
