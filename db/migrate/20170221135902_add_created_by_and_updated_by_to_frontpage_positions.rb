
class AddCreatedByAndUpdatedByToFrontpagePositions < ActiveRecord::Migration
  def up
    add_column :frontpage_elements, :created_by, :integer
    add_column :frontpage_elements, :updated_by, :integer
    add_foreign_key :frontpage_elements, :users, column: :created_by
    add_foreign_key :frontpage_elements, :users, column: :updated_by
  end

  def down
    remove_column :frontpage_elements, :created_by
    remove_column :frontpage_elements, :updated_by
  end
end

