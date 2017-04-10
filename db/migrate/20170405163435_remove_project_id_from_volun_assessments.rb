class RemoveProjectIdFromVolunAssessments < ActiveRecord::Migration
  def change
    remove_column :volun_assessments, :project_id, :int
  end
end
