class Pro::Tracking < ActiveRecord::Base

  belongs_to :project # required: true
  belongs_to :request_form

  validates :project_id, :tracked_at, presence: true
  
  def self.main_columns
    %i(project tracked_at automatic comments)
  end

end
