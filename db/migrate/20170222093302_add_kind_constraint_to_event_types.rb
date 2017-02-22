
class AddKindConstraintToEventTypes < ActiveRecord::Migration
  def up
    execute %{
    ALTER TABLE
      event_types
    ADD CONSTRAINT
      kind_and_id_must_be_equal
      CHECK (
        (id = #{EventType.kinds[:activity]} AND kind = #{EventType.kinds[:activity]}) OR
        (id = #{EventType.kinds[:project]}  AND kind = #{EventType.kinds[:project]})
      )
  }
  end

  def down
    execute %{
    ALTER TABLE
      event_types
    DROP CONSTRAINT
      kind_and_id_must_be_equal
  }
  end
end

