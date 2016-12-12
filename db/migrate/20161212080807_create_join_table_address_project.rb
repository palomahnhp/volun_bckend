class CreateJoinTableAddressProject < ActiveRecord::Migration
  def change
    create_join_table :addresses, :projects do |t|
      t.index [:address_id, :project_id]
      t.index [:project_id, :address_id]
    end
  end
end
