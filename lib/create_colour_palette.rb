module CreateColourPalette

  def create_palette
    Miro.options[:method] = "histogram"
    Miro.options[:color_count] = 6
    @path = @canva.image.url
    color = Miro::DominantColors.new("#{Rails.root}" + '/public' + @path.split('?')[0]).to_hex
  end

end
