class CreateRtVolunteerAmendments < ActiveRecord::Migration
  def change
    create_table :rt_volunteer_amendments do |t|
      t.references :road_type, index: true, foreign_key: true
      t.string :road_name
      t.string :number_type
      t.string :road_number
      t.string :postal_code
      t.string :borough
      t.references :district, index: true, foreign_key: true
      t.string :town
      t.references :province, index: true, foreign_key: true
      t.string :phone_number
      t.string :phone_number_alt
      t.string :email
      t.text :notes

      t.timestamps null: false
    end
  end
end
