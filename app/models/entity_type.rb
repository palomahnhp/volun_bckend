class EntityType < ActiveRecord::Base

  include Archivable

  validates :name, presence: true

end
