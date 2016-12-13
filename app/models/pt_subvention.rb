class PtSubvention < ActiveRecord::Base

  # include ProjectTypeCommons
  belongs_to :project, as: :pt_extendable
  belongs_to :proposal

end
