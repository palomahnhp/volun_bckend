class Manager < ActiveRecord::Base

  include Archivable

  belongs_to :profile
  belongs_to :role
  has_many :contacts, :class_name => 'Volun::Contact'
  has_many :trackings, :class_name => 'Volun::Tracking'
  has_many :request_forms
  has_one :user, as: :loggable

  validates :name, uniqueness: true
  validates :name, presence: true

  def self.main_columns
    %i(name last_name last_name_alt alias_name phone_number)
  end

  def to_s
    name
  end

end
