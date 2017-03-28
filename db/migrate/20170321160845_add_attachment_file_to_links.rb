class AddAttachmentFileToLinks < ActiveRecord::Migration
  def self.up
    change_table :links do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :links, :file
  end
end
