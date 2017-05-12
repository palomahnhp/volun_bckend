class AddColumnsToRtActivityPublishings < ActiveRecord::Migration
  def change
    add_column :rt_activity_publishings, :dates_text_free, :string
    add_column :rt_activity_publishings, :hours_text_free, :string
    add_column :rt_activity_publishings, :places_text_free, :string
    add_column :rt_activity_publishings, :observations_text_free, :string
  end
end
