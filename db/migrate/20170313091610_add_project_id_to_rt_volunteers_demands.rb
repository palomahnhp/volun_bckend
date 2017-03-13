class AddProjectIdToRtVolunteersDemands < ActiveRecord::Migration
  def change
    add_reference :rt_volunteers_demands, :project, index: true, foreign_key: true
  end
end
