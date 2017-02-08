class CreatePtPunctuals < ActiveRecord::Migration
  def change
    create_table :pt_punctuals do |t|
      t.text :notes

      t.timestamps null: false
    end
  end
end
