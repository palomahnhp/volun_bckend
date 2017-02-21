class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :name
      t.integer :profile_id
      t.string :phone_number
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
