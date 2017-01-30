class CreateRtActivityUnpublishings < ActiveRecord::Migration
  def change
    create_table :rt_activity_unpublishings do |t|
      t.text :notes

      t.timestamps null: false
    end
  end
end
