class CreateRtActivityActions < ActiveRecord::Migration
  def change
    create_table :rt_activity_actions do |t|
      t.references :activity, index: true, foreign_key: true
      t.references :action_type, index: true, foreign_key: true
      t.text :notes

      t.timestamps null: false
    end
  end
end
