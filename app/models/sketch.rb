class Sketch < ActiveRecord::Base

  belongs_to :canva
  has_attached_file :svg_file, :content_type => { :content_type => ['svg_file/svg+xml'] }
  validates_attachment_content_type :svg_file, :content_type => ['svg_file/svg+xml']
end
