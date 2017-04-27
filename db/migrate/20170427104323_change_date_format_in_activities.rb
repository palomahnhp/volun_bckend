class ChangeDateFormatInActivities < ActiveRecord::Migration
  def up
    change_column :activities, :start_date, :date
    change_column :activities, :end_date, :date
  end

  def down
    change_column :activities, :start_date, :datetime
    change_column :activities, :end_date, :datetime
  end
end
