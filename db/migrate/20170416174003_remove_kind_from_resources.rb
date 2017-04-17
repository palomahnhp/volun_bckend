class RemoveKindFromResources < ActiveRecord::Migration
  def change
    remove_column :resources, :kind, :integer
  end
end
