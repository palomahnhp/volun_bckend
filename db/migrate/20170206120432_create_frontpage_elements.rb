class CreateFrontpageElements < ActiveRecord::Migration
  def change
    create_table :frontpage_elements do |t|
      t.references :frontpage_position, index: true, foreign_key: true
      t.text :text_panel
      t.text :text_button
      t.text :image_url
      t.text :link_url
      t.text :logo_url
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
