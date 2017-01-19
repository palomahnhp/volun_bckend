class Volunteer < ActiveRecord::Base

  belongs_to :academic_level
  belongs_to :address, required: true
  belongs_to :id_number_type, required: true
  belongs_to :employment_status
  belongs_to :info_source
  belongs_to :nationality
  belongs_to :profession
  belongs_to :status
  belongs_to :technician
  belongs_to :unsubscribe_reason
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :skills
  has_many :known_languages, :class_name => 'Volun::KnownLanguage'
  has_many :assessments,     :class_name => 'Volun::Assessment'
  has_many :availabilities,  :class_name => 'Volun::Availability'
  has_many :contacts,        :class_name => 'Volun::Contact'
  has_many :trackings,       :class_name => 'Volun::Tracking'
  has_many :languages, :through => :known_languages
  has_many :traits,    :through => :assessments
  accepts_nested_attributes_for :address

  validates :name, :last_name, :id_number, :id_number, presence: true
  validates :id_number, length: { minimum: 9 }


  def self.main_columns
    %i(name last_name last_name_alt email gender)
  end

  def self.ransack_default
    {s: 'id desc'}
  end

  def to_s
    name
  end

end
