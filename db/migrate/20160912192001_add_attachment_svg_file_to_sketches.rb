class AddAttachmentSvgFileToSketches < ActiveRecord::Migration
  def self.up
    change_table :sketches do |t|
      t.attachment :svg_file
    end
  end

  def self.down
    remove_attachment :sketches, :svg_file
  end
end
