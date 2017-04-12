class Permission < ActiveRecord::Base

  belongs_to :manager
  belongs_to :resource


end
