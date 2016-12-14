class PtEntity < ActiveRecord::Base

  has_one :project, as: :pt_extendable

end
