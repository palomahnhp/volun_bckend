class AddColumnAliasNameToTrackingTypes < ActiveRecord::Migration
  def change
    add_column :tracking_types, :alias_name, :string
    add_index :tracking_types, :alias_name, unique: true
  end
end
