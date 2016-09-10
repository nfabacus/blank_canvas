module UploadPath

  def upload_path
    path = @canva.image.url(:original, timestamp: false)
    path2 = ("#{Rails.root}" + '/public' + path)
    picture = Magick::Image.read(path2).first.alpha?
  end

end
