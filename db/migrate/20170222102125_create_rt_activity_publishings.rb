class CreateRtActivityPublishings < ActiveRecord::Migration
  def change
    create_table :rt_activity_publishings do |t|
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
      t.string :borough
      t.string :district
      t.string :town
      t.string :province
      t.references :project, index: true, foreign_key: true
      t.text :notes
      t.references :activity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
