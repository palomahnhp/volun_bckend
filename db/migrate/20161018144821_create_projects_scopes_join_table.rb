class CreateProjectsScopesJoinTable < ActiveRecord::Migration
  def change
    create_table :projects_scopes, id: false do |t|
      t.integer :project_id
      t.integer :scope_id
    end
  end
end
