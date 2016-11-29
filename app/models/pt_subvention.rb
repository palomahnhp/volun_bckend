class PtSubvention < ActiveRecord::Base

  include ProjectTypeCommons

  belongs_to :proposal

end
