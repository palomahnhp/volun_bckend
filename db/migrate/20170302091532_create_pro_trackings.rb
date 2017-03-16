class CreateProTrackings < ActiveRecord::Migration
  def change
    create_table :pro_trackings do |t|
      t.references :project, index: true, foreign_key: true
      t.references :request_form, index: true, foreign_key: true
      t.datetime :tracked_at
      t.boolean :automatic, default: false
      t.text :comments

      t.timestamps null: false
    end
  end
end
