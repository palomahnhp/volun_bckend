class CreateRtVolunteerAmendments < ActiveRecord::Migration
  def change
    create_table :rt_volunteer_amendments do |t|
      t.string :road_type
      t.string :road_name
      t.string :number_type
      t.string :road_number
      t.string :postal_code
      t.string :borough
      t.string :district
      t.string :town
      t.string :province
      t.string :phone_number
      t.string :phone_number_alt
      t.string :email
      t.text :notes
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
