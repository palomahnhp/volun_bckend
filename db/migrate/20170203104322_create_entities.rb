class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
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
      t.references :request_reason, index: true, foreign_key: true
      t.references :entity_type, index: true, foreign_key: true
      t.text :comments
      t.text :other_subscribe_reason
      t.references :address, index: true, foreign_key: true
      t.boolean :active, default: true
      t.datetime :subscribed_at
      t.datetime :unsubscribed_at

      t.timestamps null: false
    end
    add_index :entities, :name, unique: true
  end
end
