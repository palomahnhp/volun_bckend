class AddLinkTypeIdToLinks < ActiveRecord::Migration
  def change
    add_reference :links, :link_type, index: true, foreign_key: true
  end
end
