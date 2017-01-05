class Rt::VolunteerUnsubscribe < ActiveRecord::Base

  include RtCommons

  belongs_to :volunteer
  has_one :request_form, as: :rt_extendable

end
