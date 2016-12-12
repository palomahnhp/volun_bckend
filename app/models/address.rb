class Address < ActiveRecord::Base

  ROAD_NUMBER_TYPES = %w(num km.)
  GRADERS = [*'A'..'Z']

  has_and_belongs_to_many :projects
  belongs_to :road_type
  belongs_to :province

  validates :road_type, :road_name, :road_number, :postal_code, :province, :country, presence: true

end
