module ValidPhoto

  def valid_photo?
    opaque? && are_you_really_what_you_say_you_are?
  end

    def find_path
      canva_image_path = @canva.image.url(:original, timestamp: false)
      absolute_path = ("#{Rails.root}" + '/public' + canva_image_path)
    end

    def opaque?
      image = MiniMagick::Image.open(find_path)
        if image["%[opaque]"] == 'false'
          false
        else
          true
        end
    end

    def are_you_really_what_you_say_you_are?
      image = MiniMagick::Image.open(find_path)
      mime_types = ["image/jpeg","image/jpg","image/png", "image/gif"]
      mime_types.include?(image.mime_type)
    end

end
