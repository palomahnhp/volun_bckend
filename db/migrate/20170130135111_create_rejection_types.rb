class CreateRejectionTypes < ActiveRecord::Migration
  def change
    create_table :rejection_types do |t|
      t.string :name
      t.text :description
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :rejection_types, :name, unique: true
  end
end
