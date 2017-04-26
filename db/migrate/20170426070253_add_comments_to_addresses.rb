class AddCommentsToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :comments, :text
  end
end
