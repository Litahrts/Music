class AddAttachmentCoverToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :profiles, :cover
  end
end
