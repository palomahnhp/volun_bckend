class Entity < ActiveRecord::Base
  include Archivable

  belongs_to :request_reason
  belongs_to :entity_type
  belongs_to :address

  validates :name, :email, :representative_name, :representative_last_name, :contact_name,
            :contact_last_name, :entity_type_id, :address_id, presence: true

  def to_s
    name
  end

end
