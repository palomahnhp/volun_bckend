class Rt::ActivitySubscribe < ActiveRecord::Base

  include RtCommons

  belongs_to :project

  def to_s
    name
  end

end
