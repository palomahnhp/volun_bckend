class Volunteer < ActiveRecord::Base

  enum gender: [:male, :female]

  belongs_to :academic_level
  belongs_to :address, required: true
  belongs_to :id_number_type, required: true
  belongs_to :employment_status
  belongs_to :info_source
  belongs_to :nationality
  belongs_to :profession
  belongs_to :status
  belongs_to :manager
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
  validates :id_number, :phone_number, :phone_number_alt, length: { minimum: 9, maximum: 9 }
  validates :phone_number, :phone_number_alt, format: { with: /\d{9}/ }
  validates :id_number, format: { with: /[\w\d]{9}/i }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }


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
