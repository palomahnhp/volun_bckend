class CreateJoinTableSkillVolunteer < ActiveRecord::Migration
  def change
    create_join_table :skills, :volunteers do |t|
      t.index [:skill_id, :volunteer_id]
      t.index [:volunteer_id, :skill_id]
    end
  end
end
