class Rt::VolunteerUnsubscribe < ActiveRecord::Base

  include RtModel

  belongs_to :volunteer
  belongs_to :unsubscribe_level
  belongs_to :project

	def self.main_columns
    %i(unsubscribe_level project notes)
  end

end
