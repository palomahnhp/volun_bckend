class EntityType < ActiveRecord::Base

  include Archivable

  validates :kind, presence: true

end
