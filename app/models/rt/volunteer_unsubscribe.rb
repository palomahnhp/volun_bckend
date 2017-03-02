class Rt::VolunteerUnsubscribe < ActiveRecord::Base

  include RtModel

  belongs_to :volunteer
  belongs_to :unsubscribe_level
  belongs_to :project
  
  validates :project, presence: true, if: :unsubscribe_level_is_project

	def self.main_columns
    %i(unsubscribe_level project notes)
  end
	
	def unsubscribe_level_is_project
		self.unsubscribe_level.try(:kind) == "project"
	end

end
