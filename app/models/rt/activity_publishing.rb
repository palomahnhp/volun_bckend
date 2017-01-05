class Rt::ActivityPublishing < ActiveRecord::Base

  include RtCommons

  has_one :request_form, as: :rt_extendable

  def to_s
    name
  end

end
