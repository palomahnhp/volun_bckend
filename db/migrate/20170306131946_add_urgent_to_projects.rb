class AddUrgentToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :urgent, :boolean, default: false
  end
end
