class AddAttachmentSvgToCanvas < ActiveRecord::Migration
  def self.up
    change_table :canvas do |t|
      t.attachment :svg
    end
  end

  def self.down
    remove_attachment :canvas, :svg
  end
end
