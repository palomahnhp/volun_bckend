class Rt::VolunteerSubscribe < ActiveRecord::Base

  include RtCommons

  def to_s
    name
  end

end
