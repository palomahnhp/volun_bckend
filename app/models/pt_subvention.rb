class PtSubvention < ActiveRecord::Base

  belongs_to :proposal
  has_one :project, as: :pt_extendable

end
