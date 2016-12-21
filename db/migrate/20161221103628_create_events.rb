class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :eventable, index: true, polymorphic: true
      t.integer :address_id

      t.timestamps null: false
    end
  end
end
