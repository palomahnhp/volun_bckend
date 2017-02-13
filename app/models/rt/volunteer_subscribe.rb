class Rt::VolunteerSubscribe < ActiveRecord::Base

  include RtCommons

  validates :name, :last_name, :last_name_alt, :phone_number, :email, presence: true

  def self.main_columns
    %i(
      name
      last_name
      last_name_alt
      phone_number
      email
    )
  end

  def to_s
    name
  end

end
