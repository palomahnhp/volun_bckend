class Rt::EntitySubscribe < ActiveRecord::Base

  include RtCommons


  belongs_to :request_reason

  def to_s
    name
  end

end
