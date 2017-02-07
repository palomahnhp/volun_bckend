
class AddKindConstraintToRequestTypes < ActiveRecord::Migration
  def up
    execute %{
      ALTER TABLE
        request_types
      ADD CONSTRAINT
        kind_and_id_must_be_equal
        CHECK (
          (id = #{RequestType.kinds[:rt_volunteer_subscribe]}   AND kind = #{RequestType.kinds[:rt_volunteer_subscribe]})   OR
          (id = #{RequestType.kinds[:rt_volunteer_unsubscribe]} AND kind = #{RequestType.kinds[:rt_volunteer_unsubscribe]}) OR
          (id = #{RequestType.kinds[:rt_volunteer_amendment]}   AND kind = #{RequestType.kinds[:rt_volunteer_amendment]})   OR
          (id = #{RequestType.kinds[:rt_volunteer_appointment]} AND kind = #{RequestType.kinds[:rt_volunteer_appointment]}) OR
          (id = #{RequestType.kinds[:rt_entity_subscribe]}      AND kind = #{RequestType.kinds[:rt_entity_subscribe]})      OR
          (id = #{RequestType.kinds[:rt_entity_unsubscribe]}    AND kind = #{RequestType.kinds[:rt_entity_unsubscribe]})    OR
          (id = #{RequestType.kinds[:rt_volunteers_demand]}     AND kind = #{RequestType.kinds[:rt_volunteers_demand]})     OR
          (id = #{RequestType.kinds[:rt_project_subscribe]}     AND kind = #{RequestType.kinds[:rt_project_subscribe]})     OR
          (id = #{RequestType.kinds[:rt_project_action]}        AND kind = #{RequestType.kinds[:rt_project_action]})        OR
          (id = #{RequestType.kinds[:rt_activity_subscribe]}    AND kind = #{RequestType.kinds[:rt_activity_subscribe]})    OR
          (id = #{RequestType.kinds[:rt_activity_action]}       AND kind = #{RequestType.kinds[:rt_activity_action]})       OR
          (id = #{RequestType.kinds[:rt_other]}                 AND kind = #{RequestType.kinds[:rt_other]})
        )
    }
  end

  def down
    execute %{
      ALTER TABLE
        request_types
      DROP CONSTRAINT
        kind_and_id_must_be_equal
    }
  end
end

