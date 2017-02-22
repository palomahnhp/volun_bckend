class Rt::ProjectAction < ActiveRecord::Base

  include RtModel

  belongs_to :project
  belongs_to :action_type


end
