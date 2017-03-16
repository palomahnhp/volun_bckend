class CreateRtVolunteerUnsubscribes < ActiveRecord::Migration
  def change
    create_table :rt_volunteer_unsubscribes do |t|
      t.references :unsubscribe_level, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.text :notes

      t.timestamps null: false
    end
  end
end
