class CreateRftEntitySubscribes < ActiveRecord::Migration
  def change
    create_table :rft_entity_subscribes do |t|
      t.references :request_form_type, index: true, foreign_key: true
      t.references :entity, index: true, foreign_key: true
      t.string :name
      t.string :vat_num
      t.string :email
      t.string :contact_name
      t.string :contact_first_surname
      t.string :contact_second_surname
      t.string :representative_name
      t.string :representative_first_surname
      t.string :representative_second_surname
      t.string :phone_number
      t.string :phone_number_alt
      t.string :road_type
      t.string :road_name
      t.string :number_type
      t.string :road_number
      t.string :postal_code
      t.string :town
      t.string :province

      t.timestamps null: false
    end
  end
end
