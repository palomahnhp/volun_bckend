class Address < ActiveRecord::Base

  ROAD_NUMBER_TYPE = %w(num km.)
  GRADER = [*'A'..'Z']

  has_and_belongs_to_many :projects
  belongs_to :road_type
  belongs_to :province

  validates :road_type, :road_name, :road_number, :postal_code, :floor, :door, :province, presence: true

end
