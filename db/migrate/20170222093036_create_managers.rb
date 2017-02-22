class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :name
      t.string :last_name
      t.string :last_name_alt
      t.string :alias_name
      t.references :role, index: true, foreign_key: true
      t.integer :profile_id
      t.string :phone_number
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
