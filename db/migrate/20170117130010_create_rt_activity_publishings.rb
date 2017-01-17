class CreateRtActivityPublishings < ActiveRecord::Migration
  def change
    create_table :rt_activity_publishings do |t|
      t.string :name
      t.string :organizer
      t.text :description
      t.date :execution_date
      t.string :execution_hour
      t.references :road_type, index: true, foreign_key: true
      t.string :road_name
      t.string :number_type
      t.string :road_number
      t.string :postal_code
      t.string :borough
      t.references :district, index: true, foreign_key: true
      t.string :town
      t.references :province, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
