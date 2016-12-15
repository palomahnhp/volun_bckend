class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.text :description
      t.string :documentum_id
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end