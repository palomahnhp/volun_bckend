class RenameNumberTypeToRoadNumberTypeInRtEntitySubscribes < ActiveRecord::Migration
  def change
    rename_column :rt_entity_subscribes, :number_type, :road_number_type
  end
end
