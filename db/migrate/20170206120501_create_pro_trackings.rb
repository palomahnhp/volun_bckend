class CreateProTrackings < ActiveRecord::Migration
  def change
    create_table :pro_trackings do |t|
      t.text :comments
      t.datetime :start_date
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
