class CreateRoadTypes < ActiveRecord::Migration
  def change
    create_table :road_types do |t|
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
