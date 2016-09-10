require 'RMagick'
include CreateColourPalette

class Canva < ActiveRecord::Base

  has_attached_file :image, :styles => {  :medium => "300x300>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_presence :image
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 5.megabytes

  before_post_process :contains_alpha?

  def contains_alpha?
    path = "#{Rails.root}" + '/public' + @canva.image.url(:original, timestamp: false)
    image = Magick::Image.read(path).first
    image.alpha?
  end

end
