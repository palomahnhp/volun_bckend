class AddKindConstraintToProjectTypes < ActiveRecord::Migration
  def up
    execute %{
      ALTER TABLE
        project_types
      ADD CONSTRAINT
        kind_and_id_must_be_equal
        CHECK (
          (id = #{ProjectType.kinds[:pt_subvention]} AND kind = '#{ProjectType.kinds[:pt_subvention]}') OR
          (id = #{ProjectType.kinds[:pt_entity]}     AND kind = '#{ProjectType.kinds[:pt_entity]}')     OR
          (id = #{ProjectType.kinds[:pt_social]}     AND kind = '#{ProjectType.kinds[:pt_social]}')     OR
          (id = #{ProjectType.kinds[:pt_centre]}     AND kind = '#{ProjectType.kinds[:pt_centre]}')     OR
          (id = #{ProjectType.kinds[:pt_permanent]}  AND kind = '#{ProjectType.kinds[:pt_permanent]}')  OR
          (id = #{ProjectType.kinds[:pt_punctual]}   AND kind = '#{ProjectType.kinds[:pt_punctual]}')   OR
          (id = #{ProjectType.kinds[:pt_entity]}     AND kind = '#{ProjectType.kinds[:pt_entity]}')     OR
          (id = #{ProjectType.kinds[:pt_subvention]} AND kind = '#{ProjectType.kinds[:pt_subvention]}') OR
          (id = #{ProjectType.kinds[:pt_other]}      AND kind = '#{ProjectType.kinds[:pt_other]}')
        )
    }
  end

  def down
    execute %{
      ALTER TABLE
        project_types
      DROP CONSTRAINT
        kind_and_id_must_be_equal
    }
  end
end
