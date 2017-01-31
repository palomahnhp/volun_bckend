class CreatePtPermanents < ActiveRecord::Migration
  def change
    create_table :pt_permanents do |t|
      t.text :notes

      t.timestamps null: false
    end
  end
end
