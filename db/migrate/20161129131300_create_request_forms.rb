class CreateRequestForms < ActiveRecord::Migration
  def change
    create_table :request_forms do |t|
      t.references :request_form_type, index: true, foreign_key: true
      t.datetime :sent_at
      t.integer :status
      t.datetime :status_date
      t.references :rejection_type, index: true, foreign_key: true
      t.text :comments

      t.timestamps null: false
    end
  end
end
