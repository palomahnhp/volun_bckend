class Entity < ActiveRecord::Base

  include Archivable

  belongs_to :reason, -> { where(active: true).order('req_reasons.name asc') }, class_name: 'Req::Reason', foreign_key: 'req_reason_id'
  belongs_to :entity_type #, required: true
  belongs_to :address, required: true
  has_one :user, as: :loggable
  has_many :projects, ->(){ order('created_at' => :asc) }
  has_many :trackings, :class_name => 'Ent::Tracking'
  has_many :links, as: :linkable
  has_one  :logo,   -> { entity_logo   }, class_name: 'Link', foreign_key: 'linkable_id'
  has_many :images, -> { entity_images }, class_name: 'Link', foreign_key: 'linkable_id'
  has_many :videos, -> { entity_videos }, class_name: 'Link', foreign_key: 'linkable_id'
  has_many :docs,   -> { entity_docs   }, class_name: 'Link', foreign_key: 'linkable_id'
  has_many :urls,   -> { entity_urls   }, class_name: 'Link', foreign_key: 'linkable_id'

  accepts_nested_attributes_for :projects
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :videos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :docs,   reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :urls,   reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :logo,   reject_if: :all_blank, allow_destroy: true

  validates :name, uniqueness: true
  validates :name, :vat_number, :email, :representative_name, :representative_last_name, :contact_name,
            :contact_last_name, :entity_type_id, presence: true
  validates :phone_number, format: { with: /[6|7|8|9]\d{8}/ }, allow_blank: true, unless: :phone_number_blank_mask
  validates :phone_number_alt, format: { with: /[6|7|8|9]\d{8}/ }, allow_blank: true, unless: :phone_number_alt_blank_mask
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

  private

  def phone_number_blank_mask
    avoid_phone_mask(phone_number)
  end

  def phone_number_alt_blank_mask
    avoid_phone_mask(phone_number_alt)
  end

  def avoid_phone_mask(phone)
    phone == "_________"
  end

end
