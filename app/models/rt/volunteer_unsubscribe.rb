class Rt::VolunteerUnsubscribe < ActiveRecord::Base

  include RtModel

  belongs_to :volunteer
  belongs_to :unsubscribe_level

	def self.main_columns
    %i(unsubscribe_level notes)
  end

end
