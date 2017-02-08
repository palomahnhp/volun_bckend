class CreatePtOthers < ActiveRecord::Migration
  def change
    create_table :pt_others do |t|
      t.text :notes

      t.timestamps null: false
    end
  end
end
