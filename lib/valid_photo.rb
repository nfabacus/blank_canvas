module ValidPhoto

  def valid_photo?
    path = @canva.image.url(:original, timestamp: false)
    path2 = ("#{Rails.root}" + '/public' + path)
    image = MiniMagick::Image.open(path2)
      if image["%[opaque]"] == 'false'
        false
      else
        true
      end
    end

end
