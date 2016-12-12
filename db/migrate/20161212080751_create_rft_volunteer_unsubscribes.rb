class CreateRftVolunteerUnsubscribes < ActiveRecord::Migration
  def change
    create_table :rft_volunteer_unsubscribes do |t|
      t.references :request_form_type, index: true, foreign_key: true
      t.references :volunteer, index: true, foreign_key: true
      t.integer :level
      t.text :reason

      t.timestamps null: false
    end
  end
end
