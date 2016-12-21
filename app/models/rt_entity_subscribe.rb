class RtEntitySubscribe < ActiveRecord::Base

  has_one :request_form, as: :rt_extendable

  def to_s
    name
  end

end
