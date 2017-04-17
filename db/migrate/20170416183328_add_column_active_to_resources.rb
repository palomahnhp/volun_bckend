class AddColumnActiveToResources < ActiveRecord::Migration
  def change
    add_column :resources, :active, :boolean, default: true
  end
end
