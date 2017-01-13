class Volunteer < ActiveRecord::Base

  has_and_belongs_to_many :projects
  has_many :known_languages, :class_name => 'Volun::KnownLanguage'
  has_many :assessments,     :class_name => 'Volun::Assessment'
  has_many :availabilities,  :class_name => 'Volun::Availability'
  has_many :contacts,        :class_name => 'Volun::Contact'
  has_many :trackings,       :class_name => 'Volun::Tracking'
  has_many :languages, :through => :known_languages
  has_many :traits,    :through => :assessments


  def to_s
    name
  end

end
