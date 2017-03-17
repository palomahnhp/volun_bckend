class CreateFrontpagePositions < ActiveRecord::Migration
  def change
    create_table :frontpage_positions do |t|
      t.integer :position
      t.text :description
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :frontpage_positions, :position, unique: true
  end
end
