class RemoveNoticeTypeIdNullConstraintFromUsers < ActiveRecord::Migration
  def change
    change_column_null :users, :notice_type_id, true
  end
end
