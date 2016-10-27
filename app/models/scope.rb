class Scope < ActiveRecord::Base
  include Archivable

  validates :name, uniqueness: true

  def self.main_attributes
    [:id, :name, :active]
  end

  def to_s
    name
  end

end
