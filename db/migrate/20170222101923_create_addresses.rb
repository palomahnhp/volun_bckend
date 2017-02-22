class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :road_type
      t.string :road_name
      t.string :road_number_type
      t.string :road_number
      t.string :grader
      t.string :stairs
      t.string :floor
      t.string :door
      t.string :postal_code
      t.string :borough
      t.string :district
      t.string :town
      t.string :province
      t.string :country
      t.string :ndp_code
      t.string :local_code
      t.string :province_code
      t.string :town_code
      t.string :district_code
      t.string :class_name
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
end
