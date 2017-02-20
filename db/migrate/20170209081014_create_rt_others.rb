class CreateRtOthers < ActiveRecord::Migration
  def change
    create_table :rt_others do |t|
      t.text :description
      t.text :notes

      t.timestamps null: false
    end
  end
end
