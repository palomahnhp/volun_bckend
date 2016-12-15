class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :active, default: true
      t.text :description
      t.string :functions
      t.date :execution_start_date
      t.date :execution_end_date
      t.string :contact_name
      t.string :contact_first_surname
      t.string :contact_second_surname
      t.string :phone_number
      t.string :email
      t.text :comments
      t.integer :beneficiaries_num
      t.integer :volunteers_num
      t.boolean :insured, default: false
      t.boolean :volunteers_allowed, default: false
      t.boolean :public, default: false
      t.boolean :outstanding, default: false
      t.date :insurance_date
      t.references :project_type, index: true, foreign_key: true
      t.references :pt_extendable, index: true, polymorphic: true
      t.references :entity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end