class Volun::AssessmentsProject < ActiveRecord::Base

  belongs_to :volunteer
  belongs_to :trait, ->{ where(active: true) }
  belongs_to :project, ->{ where(active: true).order('projects.name asc') }

  validates :volunteer_id, :trait_id, :project_id, presence: true

end