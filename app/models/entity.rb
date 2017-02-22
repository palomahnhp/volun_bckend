class Entity < ActiveRecord::Base

  include Archivable

  belongs_to :req_reason, :class_name => 'Req::Reason'
  belongs_to :entity_type, required: true
  belongs_to :address, required: true
  has_one :user, as: :loggable

  validates :name, :email, :representative_name, :representative_last_name, :contact_name,
            :contact_last_name, presence: true

  def to_s
    name
  end

end
