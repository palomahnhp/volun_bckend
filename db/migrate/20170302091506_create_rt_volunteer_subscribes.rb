class CreateRtVolunteerSubscribes < ActiveRecord::Migration
  def change
    create_table :rt_volunteer_subscribes do |t|
      t.string :name
      t.string :last_name
      t.string :last_name_alt
      t.string :phone_number
      t.string :phone_number_alt
      t.string :email
      t.boolean :publish_pictures, default: true
      t.boolean :annual_survey, default: false
      t.references :project, index: true, foreign_key: true
      t.text :notes

      t.timestamps null: false
    end
  end
end
