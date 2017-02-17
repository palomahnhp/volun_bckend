class Volunteer < ActiveRecord::Base

  include Archivable

  enum gender: [:male, :female]

  # Virtual predicate to search text in three columns as they were only one column named :full_name
  ransacker :full_name, formatter: proc { |v| v.squeeze(' ') }  do |parent|
    Arel::Nodes::InfixOperation.new(
      '||',
      Arel::Nodes::InfixOperation.new(
        '||',
        Arel::Nodes::InfixOperation.new(
          '||',
          Arel::Nodes::InfixOperation.new(
            '||',
            parent.table[:name],
            Arel::Nodes.build_quoted(' ')
          ),
          parent.table[:last_name]
        ),
        Arel::Nodes.build_quoted(' ')
      ),
      parent.table[:last_name_alt]
    )
  end

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
  has_one :user, as: :loggable
  accepts_nested_attributes_for :address

  validates :name, :last_name, :id_number, presence: true
  validates :id_number, length: { minimum: 9, maximum: 9 }
  validates :phone_number, format: { with: /[6|7]\d{8}/ }, allow_blank: true
  validates :phone_number_alt, format: { with: /[8|9]\d{8}/ }, allow_blank: true
  validates :id_number, format: { with: /[\w\d]{9}/i }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, allow_blank: true
  validates :birth_date, inclusion: { in: (150.years.ago..Date.today-1),
                                      message: I18n.t('activerecord.errors.messages.invalid_volun_birth_date'),
                                      allow_blank: true }
  validates :availability_date, inclusion: { in: (Date.today+1..Date.today+150.years),
                                             message: I18n.t('activerecord.errors.messages.invalid_volun_availability_date'),
                                             allow_blank: true }, unless: 'available?'
  validates :agreement_date, presence: {message: I18n.t('activerecord.errors.messages.invalid_volun_agreement_date')}, if: 'agreement?'
  validates :subscribe_date, inclusion: { in: (150.years.ago..Date.today+150.years),
                                          message: I18n.t('activerecord.errors.messages.invalid_volun_subscribe_dates'),
                                          allow_blank: true }
  validates :unsubscribe_date, inclusion: { in: (150.years.ago..Date.today+150.years),
                                            message: I18n.t('activerecord.errors.messages.invalid_volun_subscribe_dates'),
                                            allow_blank: true }

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
