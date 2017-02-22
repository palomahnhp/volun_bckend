class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string :name
      t.boolean :active, default: true
      t.references :degree_type, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :degrees, :name, unique: true
  end
end
