class Rt::VolunteersDemand < ActiveRecord::Base

  include RtCommons

  has_one :request_form, as: :rt_extendable

end
