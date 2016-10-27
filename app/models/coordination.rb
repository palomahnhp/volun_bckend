class Coordination < ActiveRecord::Base
  include Archivable

  validates :name, uniqueness: true

  def to_s
    name
  end

end
