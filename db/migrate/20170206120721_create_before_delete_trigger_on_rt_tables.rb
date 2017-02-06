
class CreateBeforeDeleteTriggerOnRtTables < ActiveRecord::Migration

  RT_MODELS = [
    Rt::VolunteerSubscribe,
    Rt::VolunteerUnsubscribe,
    Rt::VolunteerAmendment,
    Rt::VolunteerAppointment,
    Rt::EntitySubscribe,
    Rt::EntityUnsubscribe,
    Rt::VolunteersDemand,
    Rt::ProjectPublishing,
    Rt::ProjectUnpublishing,
    Rt::ProjectUnsubscribe,
    Rt::ActivityPublishing,
    Rt::ActivityUnpublishing,
    Rt::Other
  ]

  def up
    execute %{
      CREATE OR REPLACE FUNCTION check_request_form_references() RETURNS trigger AS $check_request_form_references$
          DECLARE
              total integer;
              rt_model_name text;
          BEGIN
              total:= 0;
              rt_model_name := TG_ARGV[0];

              -- If any reference exists then total is set to 1
              SELECT 1 into total
              FROM projects
              WHERE rt_extendable_type = rt_model_name AND rt_extendable_id = OLD.id;

              IF total > 0 THEN
                  RAISE EXCEPTION 'cannot delete a referenced extendable record';
              END IF;
              RETURN NULL;
          END;
      $check_request_form_references$ LANGUAGE plpgsql;
    }

    RT_MODELS.each do |rt_model|
      execute %{
        CREATE TRIGGER check_request_form_references BEFORE DELETE ON #{rt_model.table_name}
        FOR EACH ROW EXECUTE PROCEDURE check_request_form_references("#{rt_model.name}");
      }
    end
  end

  def down
    RT_MODELS.each do |rt_model|
      execute %{
        DROP TRIGGER check_request_form_references ON #{rt_model.table_name};
      }
    end

    execute %{
      DROP FUNCTION check_request_form_references();
    }
  end
end

