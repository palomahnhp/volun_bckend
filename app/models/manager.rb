class Manager < ActiveRecord::Base

  include Archivable

  belongs_to :profile
  belongs_to :role
  has_many :contacts, :class_name => 'Volun::Contact'
  has_many :trackings, :class_name => 'Volun::Tracking'
  has_many :request_forms
  has_many :permissions
  has_many :volunteers
  has_one  :user, as: :loggable
  delegate :is_administrator?, :super_admin?, :admin?, :internal_staff?, :external_staff?, to: :role, allow_nil: true

  validates :name, uniqueness: true
  validates :name, presence: true

  class << self
    delegate :kinds, :kinds_i18n, to: Role
  end

  def self.main_columns
    %i(name last_name last_name_alt alias_name phone_number)
  end

  def full_name
    "#{name} #{last_name}"
  end

  def to_s
    name
  end

end
