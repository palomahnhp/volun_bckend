class InfoSource < ActiveRecord::Base

  include Archivable

  validates :name, uniqueness: true
  validates :name, :active, presence: true

  def to_s
    name
  end

end
