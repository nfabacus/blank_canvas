class AddAttachmentAvatarToCanvas < ActiveRecord::Migration
  def self.up
    change_table :canvas do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :canvas, :avatar
  end
end
