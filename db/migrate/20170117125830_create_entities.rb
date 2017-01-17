class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.text :description
      t.boolean :active, default: true
      t.boolean :public_pictures, default: false
      t.boolean :annual_survey, default: false
      t.references :entity_type, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :entities, :name, unique: true
  end
end
