class CreateRftVolunteerAppointments < ActiveRecord::Migration
  def change
    create_table :rft_volunteer_appointments do |t|
      t.references :request_form_type, index: true, foreign_key: true
      t.references :volunteer, index: true, foreign_key: true
      t.text :reason

      t.timestamps null: false
    end
  end
end
