class Pt::Subvention < ActiveRecord::Base

  include PtCommons

  belongs_to :proposal

  validates :representative_name, presence: true

end
