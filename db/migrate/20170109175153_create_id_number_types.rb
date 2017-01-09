class CreateIdNumberTypes < ActiveRecord::Migration
  def change
    create_table :id_number_types do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
