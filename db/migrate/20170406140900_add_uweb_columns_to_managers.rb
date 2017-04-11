class AddUwebColumnsToManagers < ActiveRecord::Migration
  def change
    add_column :managers, :login, :string
    add_column :managers, :uweb_id, :string
    add_column :managers, :document, :string
    add_column :managers, :email, :string
    add_column :managers, :official_position, :string
    add_column :managers, :personal_number, :string
  end
end
