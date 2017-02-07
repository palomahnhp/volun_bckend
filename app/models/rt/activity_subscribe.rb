class Rt::ActivitySubscribe < ActiveRecord::Base

  include RtCommons

  belongs_to :road_type
  belongs_to :district
  belongs_to :province
  belongs_to :project

  def to_s
    name
  end

end
