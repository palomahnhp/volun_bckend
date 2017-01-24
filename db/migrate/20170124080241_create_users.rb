class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :locale
      t.references :notice_type, index: true, foreign_key: true
      t.references :loggable, polymorphic: true, index: true
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
