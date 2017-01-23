class CreateInfoSources < ActiveRecord::Migration
  def change
    create_table :info_sources do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :info_sources, :name, unique: true
  end
end
