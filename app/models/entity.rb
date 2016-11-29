class Entity < ActiveRecord::Base
  include Archivable

  belongs_to :entity_type

  def to_s
    name
  end

end
