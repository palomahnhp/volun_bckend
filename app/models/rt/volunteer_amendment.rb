class Rt::VolunteerAmendment < ActiveRecord::Base

  include RtCommons

  belongs_to :volunteer
  belongs_to :address


end
