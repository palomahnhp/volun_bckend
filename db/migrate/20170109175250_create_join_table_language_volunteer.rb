class CreateJoinTableLanguageVolunteer < ActiveRecord::Migration
  def change
    create_join_table :languages, :volunteers do |t|
      t.index [:language_id, :volunteer_id]
      t.index [:volunteer_id, :language_id]
    end
  end
end
