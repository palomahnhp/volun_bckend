
class AddEventableConstraintToEvents < ActiveRecord::Migration
  def up
    execute %{
      ALTER TABLE
        events
      ADD CONSTRAINT
        eventable_must_be_consistent
        CHECK (
          (event_type_id = #{EventType.kinds[:activity]} AND eventable_type = '#{Activity.name}') OR
          (event_type_id = #{EventType.kinds[:project]}  AND eventable_type = '#{Project.name}')
        )
    }
  end

  def down
    execute %{
      ALTER TABLE
        events
      DROP CONSTRAINT
        eventable_must_be_consistent
    }
  end
end

