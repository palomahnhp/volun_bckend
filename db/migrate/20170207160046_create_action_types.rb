class CreateActionTypes < ActiveRecord::Migration
  def change
    create_table :action_types do |t|
      t.integer :kind
      t.text :description

      t.timestamps null: false
    end
    add_index :action_types, :kind, unique: true
  end
end
