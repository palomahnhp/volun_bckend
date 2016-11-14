class ProjectTypeSubvention < ActiveRecord::Base

  belongs_to :proposal
  belongs_to :project, required: true
  belongs_to :project_type
  accepts_nested_attributes_for :project


end
