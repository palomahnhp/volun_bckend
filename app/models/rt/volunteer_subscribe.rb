class Rt::VolunteerSubscribe < ActiveRecord::Base

  include RtCommons

  validates :name, :last_name, :phone_number, :email, presence: true

  def self.main_columns
    %i(
      name
      last_name
      last_name_alt
      phone_number
      email
    )
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
