class CreateReqStatusTraces < ActiveRecord::Migration
  def change
    create_table :req_status_traces do |t|
      t.references :req_status, index: true, foreign_key: true
      t.references :request_form, index: true, foreign_key: true
      t.references :manager, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
