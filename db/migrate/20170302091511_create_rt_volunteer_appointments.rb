class CreateRtVolunteerAppointments < ActiveRecord::Migration
  def change
    create_table :rt_volunteer_appointments do |t|
      t.text :notes

      t.timestamps null: false
    end
  end
end
