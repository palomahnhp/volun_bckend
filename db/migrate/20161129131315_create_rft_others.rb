class CreateRftOthers < ActiveRecord::Migration
  def change
    create_table :rft_others do |t|
      t.references :request_form_type, index: true, foreign_key: true
      t.references :entity, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
