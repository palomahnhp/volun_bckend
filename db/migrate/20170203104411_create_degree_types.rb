class CreateDegreeTypes < ActiveRecord::Migration
  def change
    create_table :degree_types do |t|
      t.string :name
      t.string :educational_type
      t.string :active

      t.timestamps null: false
    end
    add_index :degree_types, :name, unique: true
  end
end
