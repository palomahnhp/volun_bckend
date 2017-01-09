class VolunAssessment < ActiveRecord::Base

  belongs_to :volunteer
  belongs_to :project
  belongs_to :trait


end
