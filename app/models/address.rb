class Address < ActiveRecord::Base

  has_and_belongs_to_many :projects

  validates :road_type, :road_name, :number, :postal_code, :floor_number, :door_number, presence: true


end
