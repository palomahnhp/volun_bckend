class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.references :manager, index: true, foreign_key: true
      t.references :resource, index: true, foreign_key: true
      t.boolean :create,  default: false
      t.boolean :update,  default: false
      t.boolean :read,    default: false
      t.boolean :destroy, default: false

      t.timestamps null: false
    end
  end
end
