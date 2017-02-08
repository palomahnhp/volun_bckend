class Rt::ActivityAction < ActiveRecord::Base

  include RtCommons

  belongs_to :activity
  belongs_to :action_type


end
