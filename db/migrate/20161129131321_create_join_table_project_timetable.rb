class CreateJoinTableProjectTimetable < ActiveRecord::Migration
  def change
    create_join_table :projects, :timetables do |t|
      t.index [:project_id, :timetable_id]
      t.index [:timetable_id, :project_id]
    end
  end
end
