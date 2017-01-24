class CreateNoticeTypes < ActiveRecord::Migration
  def change
    create_table :notice_types do |t|
      t.integer :kind
      t.text :description

      t.timestamps null: false
    end
    add_index :notice_types, :kind, unique: true
  end
end
