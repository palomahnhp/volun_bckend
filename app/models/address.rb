class Address < ActiveRecord::Base

  has_and_belongs_to_many :projects

  validates :road_type, :road_name, :road_number, :postal_code, :floor, :door, presence: true


end
