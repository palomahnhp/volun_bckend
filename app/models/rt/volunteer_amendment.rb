class Rt::VolunteerAmendment < ActiveRecord::Base

  include RtModel

  belongs_to :volunteer
  belongs_to :address


end
