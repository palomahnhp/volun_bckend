class Rt::EntitySubscribe < ActiveRecord::Base

  include RtModel


  belongs_to :request_reason

  def to_s
    name
  end

end
