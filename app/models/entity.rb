class Entity < ActiveRecord::Base
  include Archivable

  belongs_to :entity_type
  has_many :activities

  def to_s
    name
  end

end
