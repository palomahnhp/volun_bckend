
class CreateBeforeDeleteTriggerOnPtTables < ActiveRecord::Migration

  PT_MODELS = [
    Pt::Social,
    Pt::Centre,
    Pt::Permanent,
    Pt::Punctual,
    Pt::Subvention,
    Pt::Entity,
    Pt::Other
  ]

  def up
    execute %{
      CREATE OR REPLACE FUNCTION check_project_references() RETURNS trigger AS $check_project_references$
          DECLARE
              total integer;
              pt_model_name text;
          BEGIN
              total:= 0;
              pt_model_name := TG_ARGV[0];

              -- If any reference exists then total is set to 1
              SELECT 1 into total
              FROM projects
              WHERE pt_extendable_type = pt_model_name AND pt_extendable_id = OLD.id;

              IF total > 0 THEN
                  RAISE EXCEPTION 'Key (id)=(%) is still referenced from table "projects"', OLD.id;
              END IF;
              RETURN NULL;
          END;
      $check_project_references$ LANGUAGE plpgsql;
    }

    PT_MODELS.each do |pt_model|
      execute %{
        CREATE TRIGGER check_project_references BEFORE DELETE ON #{pt_model.table_name}
        FOR EACH ROW EXECUTE PROCEDURE check_project_references("#{pt_model.name}");
      }
    end
  end

  def down
    PT_MODELS.each do |pt_model|
      execute %{
        DROP TRIGGER check_project_references ON #{pt_model.table_name};
      }
    end

    execute %{
      DROP FUNCTION check_project_references();
    }
  end
end

