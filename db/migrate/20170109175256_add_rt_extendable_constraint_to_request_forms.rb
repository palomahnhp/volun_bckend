
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
          (request_type_id = #{RequestType.kinds[:rt_project_publishing]}    AND rt_extendable_type = '#{Rt::ProjectPublishing.name}')    OR
          (request_type_id = #{RequestType.kinds[:rt_project_unpublishing]}  AND rt_extendable_type = '#{Rt::ProjectUnpublishing.name}')  OR
          (request_type_id = #{RequestType.kinds[:rt_project_unsubscribe]}   AND rt_extendable_type = '#{Rt::ProjectUnsubscribe.name}')   OR
          (request_type_id = #{RequestType.kinds[:rt_activity_publishing]}   AND rt_extendable_type = '#{Rt::ActivityPublishing.name}')   OR
          (request_type_id = #{RequestType.kinds[:rt_activity_unpublishing]} AND rt_extendable_type = '#{Rt::ActivityUnpublishing.name}') OR
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

