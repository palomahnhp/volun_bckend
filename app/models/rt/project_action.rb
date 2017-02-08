class Rt::ProjectAction < ActiveRecord::Base

  include RtCommons

  belongs_to :project
  belongs_to :action_type


end
