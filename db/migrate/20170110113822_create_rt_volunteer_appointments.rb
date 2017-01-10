class CreateRtVolunteerAppointments < ActiveRecord::Migration
  def change
    create_table :rt_volunteer_appointments do |t|
      t.references :volunteer, index: true, foreign_key: true
      t.text :reason

      t.timestamps null: false
    end
  end
end
