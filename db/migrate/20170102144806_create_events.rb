class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :eventable, polymorphic: true, index: true
      t.integer :address_id

      t.timestamps null: false
    end
  end
end
