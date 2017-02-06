class CreateRtEntitySubscribes < ActiveRecord::Migration
  def change
    create_table :rt_entity_subscribes do |t|
      t.string :name
      t.text :description
      t.string :vat_number
      t.string :email
      t.string :representative_name
      t.string :representative_last_name
      t.string :representative_last_name_alt
      t.string :contact_name
      t.string :contact_last_name
      t.string :contact_last_name_alt
      t.string :phone_number
      t.string :phone_number_alt
      t.boolean :publish_pictures, default: true
      t.boolean :annual_survey, default: false
      t.references :entity_type, index: true, foreign_key: true
      t.text :comments
      t.text :other_subscribe_reason
      t.references :road_type, index: true, foreign_key: true
      t.string :road_name
      t.string :number_type
      t.string :road_number
      t.string :postal_code
      t.string :borough
      t.references :district, index: true, foreign_key: true
      t.string :town
      t.references :province, index: true, foreign_key: true
      t.text :notes

      t.timestamps null: false
    end
  end
end
