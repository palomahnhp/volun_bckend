class Rt::ActivityAction < ActiveRecord::Base

  include RtModel

  belongs_to :activity
  belongs_to :action_type


end
