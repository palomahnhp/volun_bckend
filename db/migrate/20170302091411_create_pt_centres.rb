class CreatePtCentres < ActiveRecord::Migration
  def change
    create_table :pt_centres do |t|
      t.text :notes

      t.timestamps null: false
    end
  end
end
