
class AddRtExtendableConstraintToRequestForms < ActiveRecord::Migration
  def up
    execute %{
      ALTER TABLE
        request_forms
      ADD CONSTRAINT
        rt_extendable_must_be_consistent
        CHECK (
          (request_type_id = #{RequestType.kinds[:rt_volunteer_subscribe]}   AND rt_extendable_type = '#{Rt::VolunteerSubscribe.name}')   OR
          (request_type_id = #{RequestType.kinds[:rt_volunteer_unsubscribe]} AND rt_extendable_type = '#{Rt::VolunteerUnsubscribe.name}') OR
          (request_type_id = #{RequestType.kinds[:rt_volunteer_amendment]}   AND rt_extendable_type = '#{Rt::VolunteerAmendment.name}')   OR
          (request_type_id = #{RequestType.kinds[:rt_volunteer_appointment]} AND rt_extendable_type = '#{Rt::VolunteerAppointment.name}') OR
          (request_type_id = #{RequestType.kinds[:rt_entity_subscribe]}      AND rt_extendable_type = '#{Rt::EntitySubscribe.name}')      OR
          (request_type_id = #{RequestType.kinds[:rt_entity_unsubscribe]}    AND rt_extendable_type = '#{Rt::EntityUnsubscribe.name}')    OR
          (request_type_id = #{RequestType.kinds[:rt_volunteers_demand]}     AND rt_extendable_type = '#{Rt::VolunteersDemand.name}')     OR
          (request_type_id = #{RequestType.kinds[:rt_project_subscribe]}     AND rt_extendable_type = '#{Rt::ProjectSubscribe.name}')     OR
          (request_type_id = #{RequestType.kinds[:rt_project_action]}        AND rt_extendable_type = '#{Rt::ProjectAction.name}')        OR
          (request_type_id = #{RequestType.kinds[:rt_activity_subscribe]}    AND rt_extendable_type = '#{Rt::ActivitySubscribe.name}')    OR
          (request_type_id = #{RequestType.kinds[:rt_activity_action]}       AND rt_extendable_type = '#{Rt::ActivityAction.name}')       OR
          (request_type_id = #{RequestType.kinds[:rt_other]}                 AND rt_extendable_type = '#{Rt::Other.name}')
        )
    }
  end

  def down
    execute %{
      ALTER TABLE
        request_forms
      DROP CONSTRAINT
        rt_extendable_must_be_consistent
    }
  end
end

