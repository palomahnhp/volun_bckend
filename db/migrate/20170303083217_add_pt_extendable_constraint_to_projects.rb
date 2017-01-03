class AddPtExtendableConstraintToProjects < ActiveRecord::Migration
  def up
    execute %{
      ALTER TABLE
        projects
      ADD CONSTRAINT
        extendable_must_be_consistent
        CHECK (
          (project_type_id = #{ProjectType.kinds[:pt_subvention]} AND pt_extendable_type = '#{PtSubvention.name}') OR
          (project_type_id = #{ProjectType.kinds[:pt_entity]} AND pt_extendable_type = '#{PtEntity.name}') OR
          (project_type_id = #{ProjectType.kinds[:pt_social]})    OR
          (project_type_id = #{ProjectType.kinds[:pt_centre]})    OR
          (project_type_id = #{ProjectType.kinds[:pt_permanent]}) OR
          (project_type_id = #{ProjectType.kinds[:pt_punctual]})  OR
          (project_type_id = #{ProjectType.kinds[:pt_other]})
        )
    }
  end 

  def down
    execute %{
      ALTER TABLE
        projects
      DROP CONSTRAINT
        extendable_must_be_consistent
    }
  end
end
