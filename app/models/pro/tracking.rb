class Pro::Tracking < ActiveRecord::Base

  belongs_to :project, required: true
  belongs_to :request_form


end
