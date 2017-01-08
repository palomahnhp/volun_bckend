class Rt::EntitySubscribe < ActiveRecord::Base

  include RtCommons

  has_one :request_form, as: :rt_extendable
  belongs_to :request_reason

  def to_s
    name
  end

end
