class CreateReqStatuses < ActiveRecord::Migration
  def change
    create_table :req_statuses do |t|
      t.integer :kind
      t.text :description

      t.timestamps null: false
    end
    add_index :req_statuses, :kind, unique: true
  end
end
