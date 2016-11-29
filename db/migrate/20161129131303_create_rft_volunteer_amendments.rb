class CreateRftVolunteerAmendments < ActiveRecord::Migration
  def change
    create_table :rft_volunteer_amendments do |t|
      t.references :request_form_type, index: true, foreign_key: true
      t.references :volunteer, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true
      t.string :phone_number
      t.string :phone_number_alt

      t.timestamps null: false
    end
  end
end
