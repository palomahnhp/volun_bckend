class Entity < ActiveRecord::Base
  include Archivable

  belongs_to :request_reason
  belongs_to :entity_type
  belongs_to :address

  def to_s
    name
  end

end
