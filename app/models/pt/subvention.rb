class Pt::Subvention < ActiveRecord::Base

  include PtCommons
  belongs_to :proposal

end
