class CreateJoinTableCollectiveVolunteer < ActiveRecord::Migration
  def change
    create_join_table :collectives, :volunteers do |t|
      t.index [:collective_id, :volunteer_id]
      t.index [:volunteer_id, :collective_id]
    end
  end
end
