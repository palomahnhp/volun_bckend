class Pro::Issue < ActiveRecord::Base

  belongs_to :project, required: true


end
