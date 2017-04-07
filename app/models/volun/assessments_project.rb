class Volun::AssessmentsProject < ActiveRecord::Base

  belongs_to :volunteer
  belongs_to :trait
  belongs_to :project

  validates :volunteer_id, :trait_id, :project_id, presence: true

end