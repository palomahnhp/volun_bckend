class AddMainToResources < ActiveRecord::Migration
  def change
    add_column :resources, :main, :boolean, default: false
  end
end
