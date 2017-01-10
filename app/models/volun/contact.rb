class Volun::Contact < ActiveRecord::Base

  belongs_to :volunteer
  belongs_to :contact_result
  belongs_to :project
  belongs_to :technician


end
