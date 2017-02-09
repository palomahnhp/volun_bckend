class CreateProjectTypes < ActiveRecord::Migration
  def change
    create_table :project_types do |t|
      t.integer :kind
      t.text :description

      t.timestamps null: false
    end
    add_index :project_types, :kind, unique: true
  end
end
