class Entity < ActiveRecord::Base
  include Archivable

  belongs_to :entity_type
  belongs_to :address, required: true
  has_many :activities

  def to_s
    name
  end

end
