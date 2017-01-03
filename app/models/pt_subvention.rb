class PtSubvention < ActiveRecord::Base

  include PtCommons
  belongs_to :proposal

end
