class CreateSubscribeReasons < ActiveRecord::Migration
  def change
    create_table :subscribe_reasons do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :subscribe_reasons, :name, unique: true
  end
end
