class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :name
      t.string :last_name
      t.string :last_name_alt
      t.references :id_number_type, index: true, foreign_key: true
      t.string :id_number
      t.integer :gender
      t.date :birth_date
      t.references :nationality, index: true, foreign_key: true
      t.string :phone_number
      t.string :phone_number_alt
      t.string :email
      t.references :address, index: true, foreign_key: true
      t.references :status, index: true, foreign_key: true
      t.references :employment_status, index: true, foreign_key: true
      t.boolean :vocne, default: false
      t.boolean :available, default: false
      t.date :availability_date
      t.references :academic_level, index: true, foreign_key: true
      t.date :subscribe_date
      t.date :unsubscribe_date
      t.references :unsubscribe_reason, index: true, foreign_key: true
      t.text :comments
      t.text :expectations
      t.boolean :agreement, default: false
      t.datetime :agreement_date
      t.boolean :search_authorization, default: false
      t.boolean :representative_statement, default: false
      t.boolean :has_driving_license, default: false
      t.boolean :publish_pictures, default: true
      t.boolean :annual_survey, default: false
      t.datetime :subscribed_at
      t.references :manager, index: true, foreign_key: true
      t.references :info_source, index: true, foreign_key: true
      t.text :other_academic_info
      t.text :error_address
      t.text :error_other
      t.integer :review
      t.references :profession, index: true, foreign_key: true
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
