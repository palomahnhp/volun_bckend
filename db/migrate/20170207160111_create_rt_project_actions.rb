class CreateRtProjectActions < ActiveRecord::Migration
  def change
    create_table :rt_project_actions do |t|
      t.references :project, index: true, foreign_key: true
      t.references :action_type, index: true, foreign_key: true
      t.text :notes

      t.timestamps null: false
    end
  end
end
