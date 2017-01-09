class VolunTracking < ActiveRecord::Base

  belongs_to :volunteer
  belongs_to :tracking
  belongs_to :project
  belongs_to :technician


end
