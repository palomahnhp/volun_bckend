class CreateRftVolunteersDemands < ActiveRecord::Migration
  def change
    create_table :rft_volunteers_demands do |t|
      t.references :request_form_type, index: true, foreign_key: true
      t.references :entity, index: true, foreign_key: true
      t.text :description
      t.date :execution_start_date
      t.date :execution_end_date
      t.string :road_type
      t.string :road_name
      t.string :number_type
      t.string :road_number
      t.string :postal_code
      t.string :town
      t.string :province
      t.string :requested_volunteers_num
      t.text :volunteers_profile
      t.text :volunteer_functions_1
      t.text :volunteer_functions_2
      t.text :volunteer_functions_3

      t.timestamps null: false
    end
  end
end
