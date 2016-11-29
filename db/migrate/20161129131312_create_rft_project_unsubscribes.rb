class CreateRftProjectUnsubscribes < ActiveRecord::Migration
  def change
    create_table :rft_project_unsubscribes do |t|
      t.references :request_form_type, index: true, foreign_key: true
      t.references :entity, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.text :reason

      t.timestamps null: false
    end
  end
end
