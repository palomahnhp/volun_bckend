class CreateReqRejectionTypes < ActiveRecord::Migration
  def change
    create_table :req_rejection_types do |t|
      t.string :name
      t.text :description
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :req_rejection_types, :name, unique: true
  end
end
