class CreateRtVolunteerSubscribes < ActiveRecord::Migration
  def change
    create_table :rt_volunteer_subscribes do |t|
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
      t.references :road_type, index: true, foreign_key: true
      t.string :road_name
      t.string :number_type
      t.string :road_number
      t.string :postal_code
      t.string :borough
      t.references :district, index: true, foreign_key: true
      t.string :town
      t.references :province, index: true, foreign_key: true
      t.references :status, index: true, foreign_key: true
      t.references :employment_status, index: true, foreign_key: true
      t.boolean :vocne
      t.boolean :available
      t.date :availability_date
      t.references :academic_level, index: true, foreign_key: true
      t.text :comments
      t.text :expectations
      t.boolean :agreement
      t.datetime :agreement_date
      t.boolean :search_authorization
      t.boolean :representative_statement
      t.boolean :has_driving_license
      t.boolean :publish_pictures
      t.boolean :annual_survey
      t.references :info_source, index: true, foreign_key: true
      t.text :other_academic_info
      t.references :profession, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
