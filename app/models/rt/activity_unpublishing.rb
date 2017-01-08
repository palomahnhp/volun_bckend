class Rt::ActivityUnpublishing < ActiveRecord::Base

  include RtCommons

  has_one :request_form, as: :rt_extendable

end
