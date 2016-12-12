class CreateRftActivityPublishings < ActiveRecord::Migration
  def change
    create_table :rft_activity_publishings do |t|
      t.references :request_form_type, index: true, foreign_key: true
      t.references :entity, index: true, foreign_key: true
      t.string :name
      t.string :organizer
      t.text :description
      t.date :execution_date
      t.string :execution_hour
      t.string :road_type
      t.string :road_name
      t.string :number_type
      t.string :road_number
      t.string :postal_code
      t.string :town
      t.string :province

      t.timestamps null: false
    end
  end
end
