class RemoveKindFromLinks < ActiveRecord::Migration
  def change
    remove_column :links, :kind, :integer
  end
end
