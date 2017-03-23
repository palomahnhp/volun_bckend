class Entity < ActiveRecord::Base

  include Archivable

  belongs_to :reason, class_name: 'Req::Reason', foreign_key: 'req_reason_id'
  belongs_to :entity_type #, required: true
  belongs_to :address, required: true
  has_one :user, as: :loggable
  has_many :projects, ->(){ order('created_at' => :asc) }
  has_many :trackings, :class_name => 'Ent::Tracking'
  accepts_nested_attributes_for :projects
  accepts_nested_attributes_for :address

  validates :name, uniqueness: true
  validates :name, :vat_number, :email, :representative_name, :representative_last_name, :contact_name,
            :contact_last_name, :entity_type_id, presence: true
  validates :phone_number, format: { with: /[6|7|8|9]\d{8}/ }, allow_blank: true
  validates :phone_number_alt, format: { with: /[6|7|8|9]\d{8}/ }, allow_blank: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, allow_blank: true
  validates :vat_number, spanish_vat: true

  scope :all_active,   ->(){ where(active: true) }
  scope :all_inactive, ->(){ where(active: false) }

  def self.main_columns
    %i(name vat_number email entity_type)
  end

  def to_s
    name
  end
end
