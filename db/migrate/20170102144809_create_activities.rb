class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.text :transport
      t.string :pdf_url
      t.integer :entity_id
      t.integer :area_id
      t.integer :project_id
      t.boolean :share, default: false

      t.timestamps null: false
    end
  end
end
