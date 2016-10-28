class Project < ActiveRecord::Base
  belongs_to :project_type
  belongs_to :district
  belongs_to :neighborhood
  belongs_to :proposal
  belongs_to :organization

  def to_s
    name
  end

end
