class Rt::EntitySubscribe < ActiveRecord::Base

  has_one :request_form, as: :rt_extendable
  belongs_to :request_reason

  def to_s
    name
  end

end
