class CreateRftVolunteerSubscribes < ActiveRecord::Migration
  def change
    create_table :rft_volunteer_subscribes do |t|
      t.references :request_form_type, index: true, foreign_key: true
      t.string :name
      t.string :first_surname
      t.string :second_surname
      t.string :phone_number
      t.string :phone_number_alt
      t.string :email

      t.timestamps null: false
    end
  end
end
