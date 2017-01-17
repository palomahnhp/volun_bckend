class CreateRtVolunteerSubscribes < ActiveRecord::Migration
  def change
    create_table :rt_volunteer_subscribes do |t|
      t.string :name
      t.string :last_name
      t.string :last_name_alt
      t.string :phone_number
      t.string :phone_number_alt
      t.string :email
      t.boolean :public_pictures, default: false
      t.boolean :annual_survey, default: false

      t.timestamps null: false
    end
  end
end
