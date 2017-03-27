class CreateLinkTypes < ActiveRecord::Migration
  def change
    create_table :link_types do |t|
      t.integer :kind
      t.text :description

      t.timestamps null: false
    end
    add_index :link_types, :kind, unique: true
  end
end
