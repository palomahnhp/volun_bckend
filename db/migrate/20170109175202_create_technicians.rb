class CreateTechnicians < ActiveRecord::Migration
  def change
    create_table :technicians do |t|
      t.string :name
      t.string :profile_id
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
