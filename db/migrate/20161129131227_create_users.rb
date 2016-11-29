class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :locale
      t.references :profileable, index: true, polymorphic: true

      t.timestamps null: false
    end
  end
end
