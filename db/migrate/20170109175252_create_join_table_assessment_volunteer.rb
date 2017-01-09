class CreateJoinTableAssessmentVolunteer < ActiveRecord::Migration
  def change
    create_join_table :assessments, :volunteers do |t|
      t.index [:assessment_id, :volunteer_id]
      t.index [:volunteer_id, :assessment_id]
    end
  end
end
