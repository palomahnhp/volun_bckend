class RenameUrlInLinksToPath < ActiveRecord::Migration
  def change
    rename_column :links, :url, :path
  end
end
