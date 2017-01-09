class CreateNationalities < ActiveRecord::Migration
  def change
    create_table :nationalities do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
