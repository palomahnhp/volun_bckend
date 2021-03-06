class CreateVolunTrackings < ActiveRecord::Migration
  def change
    create_table :volun_trackings do |t|
      t.references :volunteer, index: true, foreign_key: true
      t.references :tracking_type, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.references :manager, index: true, foreign_key: true
      t.references :request_form, index: true, foreign_key: true
      t.datetime :tracked_at
      t.boolean :automatic, default: false
      t.text :comments

      t.timestamps null: false
    end
  end
end
