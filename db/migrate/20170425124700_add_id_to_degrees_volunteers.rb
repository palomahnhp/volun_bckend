class AddIdToDegreesVolunteers < ActiveRecord::Migration
  def change
    add_column :degrees_volunteers, :id, :primary_key
  end
end
