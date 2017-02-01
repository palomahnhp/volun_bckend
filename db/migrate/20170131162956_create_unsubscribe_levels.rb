class CreateUnsubscribeLevels < ActiveRecord::Migration
  def change
    create_table :unsubscribe_levels do |t|
      t.integer :kind
      t.text :description

      t.timestamps null: false
    end
    add_index :unsubscribe_levels, :kind, unique: true
  end
end
