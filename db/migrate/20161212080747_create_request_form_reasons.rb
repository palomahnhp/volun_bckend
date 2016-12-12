class CreateRequestFormReasons < ActiveRecord::Migration
  def change
    create_table :request_form_reasons do |t|
      t.integer :kind
      t.text :description
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
