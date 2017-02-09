class CreateRtProjectSubscribes < ActiveRecord::Migration
  def change
    create_table :rt_project_subscribes do |t|
      t.text :description
      t.string :road_type
      t.string :road_name
      t.string :number_type
      t.string :road_number
      t.string :postal_code
      t.string :borough
      t.string :district
      t.string :town
      t.string :province
      t.text :notes

      t.timestamps null: false
    end
  end
end
