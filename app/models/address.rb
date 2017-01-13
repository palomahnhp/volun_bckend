class Address < ActiveRecord::Base

  include BdcCompatible

  ROAD_NUMBER_TYPES = %w(num km.)
  GRADERS = [*'A'..'Z']

  belongs_to :road_type
  belongs_to :province

  validates :road_type_id, :road_name, :road_number, :postal_code, :province, :country, :town, presence: true

end