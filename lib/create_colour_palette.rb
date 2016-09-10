module CreateColourPalette

  def create_palette
    Miro.options[:method] = "histogram"
    Miro.options[:color_count] = 6
    @path = @canva.image.url(:original, timestamp: false)
    color = Miro::DominantColors.new("#{Rails.root}" + '/public' + @path).to_hex
  end

end
