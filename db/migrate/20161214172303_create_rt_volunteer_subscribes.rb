class CreateRtVolunteerSubscribes < ActiveRecord::Migration
  def change
    create_table :rt_volunteer_subscribes do |t|
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