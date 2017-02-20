class Pro::Tracking < ActiveRecord::Base

  belongs_to :project, required: true


end
