class Area < ActiveRecord::Base
  include Archivable

  has_and_belongs_to_many :projects
  has_many :activities

  validates :name, uniqueness: true

  def self.main_columns
    [:id, :name, :active]
  end

  def to_s
    name
  end

end
