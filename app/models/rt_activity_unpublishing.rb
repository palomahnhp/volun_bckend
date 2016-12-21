class RtActivityUnpublishing < ActiveRecord::Base

  has_one :request_form, as: :rt_extendable

end
