class Entity < ActiveRecord::Base

  include Archivable

  belongs_to :request_reason
  belongs_to :entity_type, required: true
  belongs_to :address, required: true

  validates :name, :email, :representative_name, :representative_last_name, :contact_name,
            :contact_last_name, presence: true

  def to_s
    name
  end

  def self.main_columns
    %i(name
       description
       vat_number
       email
       entity_type_id
       comments
       other_subscribe_reason
       address_id
       active
       subscribed_at)
  end
end
