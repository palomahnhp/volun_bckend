class CreateJoinTableEntityProject < ActiveRecord::Migration
  def change
    create_join_table :entities, :projects do |t|
      t.index [:entity_id, :project_id]
      t.index [:project_id, :entity_id]
    end
  end
end
