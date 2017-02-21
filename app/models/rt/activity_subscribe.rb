class Rt::ActivitySubscribe < ActiveRecord::Base

  include RtModel

  belongs_to :project

  def to_s
    name
  end

end
