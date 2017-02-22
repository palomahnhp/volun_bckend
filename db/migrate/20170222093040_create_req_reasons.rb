class CreateReqReasons < ActiveRecord::Migration
  def change
    create_table :req_reasons do |t|
      t.integer :kind
      t.text :description
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :req_reasons, :kind, unique: true
  end
end
