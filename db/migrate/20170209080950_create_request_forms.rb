class CreateRequestForms < ActiveRecord::Migration
  def change
    create_table :request_forms do |t|
      t.references :request_type, index: true, foreign_key: true
      t.references :rt_extendable, polymorphic: true, index: true
      t.references :user, index: true, foreign_key: true
      t.references :req_status, index: true, foreign_key: true
      t.datetime :status_date
      t.references :req_rejection_type, index: true, foreign_key: true
      t.references :req_reason, index: true, foreign_key: true
      t.text :comments

      t.timestamps null: false
    end
  end
end
