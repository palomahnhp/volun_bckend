class CreatePtSocials < ActiveRecord::Migration
  def change
    create_table :pt_socials do |t|
      t.references :project, index: true, foreign_key: true
      t.references :project_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
