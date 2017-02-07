class Rt::ProjectSubscribe < ActiveRecord::Base

  include RtCommons

  belongs_to :road_type
  belongs_to :district
  belongs_to :province


end
