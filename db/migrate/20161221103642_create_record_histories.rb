class CreateRecordHistories < ActiveRecord::Migration
  def change
    create_table :record_histories do |t|
      t.references :user, index: true, foreign_key: true
      t.references :recordable, index: true, polymorphic: true
      t.datetime :recordable_changed_at

      t.timestamps null: false
    end
  end
end
