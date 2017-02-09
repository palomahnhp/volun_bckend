class CreatePtSocials < ActiveRecord::Migration
  def change
    create_table :pt_socials do |t|
      t.text :notes

      t.timestamps null: false
    end
  end
end
