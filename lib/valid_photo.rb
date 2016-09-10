module ValidPhoto

  def valid_photo?
    path = @canva.image.url(:original, timestamp: false)
    path2 = ("#{Rails.root}" + '/public' + path)
    picture = Magick::Image.read(path2).first
    !picture.alpha?
  end

end
