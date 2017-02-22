class Rt::ActivityPublishing < ActiveRecord::Base

  include RtModel

  belongs_to :road_type
  belongs_to :province
  belongs_to :district
  belongs_to :project


  def to_s
    name
  end

end
