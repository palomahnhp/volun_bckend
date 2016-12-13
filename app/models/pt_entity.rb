class PtEntity < ActiveRecord::Base

  # include ProjectTypeCommons
  belongs_to :project, as: :pt_extendable

end
