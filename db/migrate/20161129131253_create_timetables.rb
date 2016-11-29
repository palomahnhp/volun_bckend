class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.integer :day
      t.string :start_hour
      t.string :end_hour

      t.timestamps null: false
    end
  end
end
