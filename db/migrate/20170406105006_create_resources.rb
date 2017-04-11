class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.integer :kind
      t.string :description

      t.timestamps null: false
    end
    add_index :resources, :kind, unique: true
  end
end
