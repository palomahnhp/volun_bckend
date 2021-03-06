
class AddPtExtendableConstraintToProjects < ActiveRecord::Migration
  def up
    execute %{
      ALTER TABLE
        projects
      ADD CONSTRAINT
        pt_extendable_must_be_consistent
        CHECK (
          (project_type_id = #{ProjectType.kinds[:pt_social]}     AND pt_extendable_type = '#{Pt::Social.name}')     OR
          (project_type_id = #{ProjectType.kinds[:pt_centre]}     AND pt_extendable_type = '#{Pt::Centre.name}')     OR
          (project_type_id = #{ProjectType.kinds[:pt_permanent]}  AND pt_extendable_type = '#{Pt::Permanent.name}')  OR
          (project_type_id = #{ProjectType.kinds[:pt_punctual]}   AND pt_extendable_type = '#{Pt::Punctual.name}')   OR
          (project_type_id = #{ProjectType.kinds[:pt_entity]}     AND pt_extendable_type = '#{Pt::Entity.name}')     OR
          (project_type_id = #{ProjectType.kinds[:pt_subvention]} AND pt_extendable_type = '#{Pt::Subvention.name}') OR
          (project_type_id = #{ProjectType.kinds[:pt_other]}      AND pt_extendable_type = '#{Pt::Other.name}')
        )
    }
  end

  def down
    execute %{
      ALTER TABLE
        projects
      DROP CONSTRAINT
        pt_extendable_must_be_consistent
    }
  end
end

