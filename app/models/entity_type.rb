class EntityType < ActiveRecord::Base

  include Archivable

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end

end
