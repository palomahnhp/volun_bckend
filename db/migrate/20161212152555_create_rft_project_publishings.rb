class CreateRftProjectPublishings < ActiveRecord::Migration
  def change
    create_table :rft_project_publishings do |t|
      t.references :request_form_type, index: true, foreign_key: true
      t.references :entity, index: true, foreign_key: true
      t.text :description
      t.string :road_type
      t.string :road_name
      t.string :number_type
      t.string :road_number
      t.string :postal_code
      t.string :town
      t.string :province

      t.timestamps null: false
    end
  end
end
