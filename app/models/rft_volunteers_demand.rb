class RftVolunteersDemand < ActiveRecord::Base

  belongs_to :request_form_type
  belongs_to :entity


end
