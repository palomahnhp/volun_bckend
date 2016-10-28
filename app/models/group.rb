class Group < ActiveRecord::Base

  include Recordable
  include Archivable

  validates :name, uniqueness: true

  def self.main_columns
    [:id, :name, :active]
  end

  def to_s
    name
  end

end
