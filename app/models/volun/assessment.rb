class Volun::Assessment < ActiveRecord::Base

  belongs_to :volunteer
  belongs_to :trait
  belongs_to :project

  validates :volunteer_id, :trait_id, :project_id, :assessment, presence: true

end
