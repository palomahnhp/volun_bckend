class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :kind
      t.text :description

      t.timestamps null: false
    end
    add_index :roles, :kind, unique: true
  end
end
