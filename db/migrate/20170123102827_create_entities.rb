class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.text :description
      t.string :email
      t.boolean :active, default: true
      t.string :representative_name
      t.string :representative_last_name
      t.string :representative_last_name_alt
      t.string :contact_name
      t.string :contact_last_name_alt
      t.string :contact_last_name
      t.boolean :public_pictures, default: false
      t.boolean :annual_survey, default: false
      t.references :entity_type, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
    add_index :entities, :name, unique: true
  end
end
