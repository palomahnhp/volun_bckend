class AddColumnSystemToTrackingTypes < ActiveRecord::Migration
  def change
    add_column :tracking_types, :system, :boolean, default: false
  end
end
