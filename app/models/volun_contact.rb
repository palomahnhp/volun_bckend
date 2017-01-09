class VolunContact < ActiveRecord::Base

  belongs_to :volunteer
  belongs_to :project
  belongs_to :technician
  belongs_to :contact_result


end
