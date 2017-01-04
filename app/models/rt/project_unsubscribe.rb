class Rt::ProjectUnsubscribe < ActiveRecord::Base

  belongs_to :project
  has_one :request_form, as: :rt_extendable

end
