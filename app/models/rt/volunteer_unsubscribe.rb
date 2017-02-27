class Rt::VolunteerUnsubscribe < ActiveRecord::Base

  include RtModel

  belongs_to :volunteer
  belongs_to :unsubscribe_level

	def self.main_columns
    %i(unsubscribe_level notes)
  end
	
	def volunteer_attributes
    {
      name:          name,
      last_name:     last_name,
      last_name_alt: last_name_alt,
      phone_number:  phone_number,
      email:         email
    }
  end
	
	def full_name
    "#{name} #{last_name} #{last_name_alt}"
  end

  alias_method :to_s, :full_name

end
