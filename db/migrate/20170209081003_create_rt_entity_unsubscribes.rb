class CreateRtEntityUnsubscribes < ActiveRecord::Migration
  def change
    create_table :rt_entity_unsubscribes do |t|
      t.text :notes

      t.timestamps null: false
    end
  end
end
