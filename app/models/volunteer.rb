class Volunteer < ActiveRecord::Base

  has_many :rt_volunteer_unsubscribes, :class_name => 'Rt::VolunteerUnsubscribe'
  has_many :rt_volunteer_appointments, :class_name => 'Rt::VolunteerAppointment'
  has_many :rt_volunteer_amendments, :class_name => 'Rt::VolunteerAmendment'


  def to_s
    name
  end

end
