class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.text :description
      t.integer :kind
      t.references :linkable, index: true, polymorphic: true

      t.timestamps null: false
    end
  end
end
