class CreateReqReasons < ActiveRecord::Migration
  def change
    create_table :req_reasons do |t|
      t.string :name
      t.text :description
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
