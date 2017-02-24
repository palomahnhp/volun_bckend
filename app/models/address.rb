class Address < ActiveRecord::Base

  include BdcCompatible

  has_many :entities
  has_many :volunteers

  validates :road_type, :road_name, :road_number, :postal_code, :province, :country, :town, presence: true
  validates :postal_code, format: { with: /\d{5}/ }

end