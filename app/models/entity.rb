class Entity < ActiveRecord::Base

  include Archivable

  belongs_to :request_reason, required: true
  belongs_to :entity_type, required: true
  belongs_to :address, required: true

  validates :name, :email, :representative_name, :representative_last_name, :contact_name,
            :contact_last_name, presence: true

  def to_s
    name
  end

end
