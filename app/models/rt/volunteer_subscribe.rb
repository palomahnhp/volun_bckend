class Rt::VolunteerSubscribe < ActiveRecord::Base

  include RtCommons

  def self.main_attributes
    %i(
      name
      last_name
      last_name_alt
      phone_number
      email
      notes
    )
  end

  def to_s
    name
  end

end
