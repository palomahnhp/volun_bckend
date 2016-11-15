class ProjectTypeSubvention < ActiveRecord::Base

  include ProjectTypeCommons

  belongs_to :proposal


end
