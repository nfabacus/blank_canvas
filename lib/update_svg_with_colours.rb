module UpdateSVGWithColours

  def update_svg_with_colours
    @svg_path = "#{Rails.root}" + "/public/images/room_#{params[:room_choice]}.svg"

    @svg_file = File.open(@svg_path) { |f| Nokogiri::XML(f) }

    @colors = {sofa: params[:sofa],
               cushion_one: params[:cushion_one],
               cushion_two: params[:cushion_two],
               room_wall: params[:room_wall],
               room_floor: params[:room_floor],
               lamp: params[:lamp],
               carpet: params[:carpet],
               coffee_table: params[:coffee_table],
               lamp_secondary: params[:lamp_secondary],
               lamp_body: params[:lamp_body],
               sofa_secondary: params[:sofa_secondary],
               coffee_table_legs: params[:coffee_table_legs],
               coffee_table_drawer: params[:coffee_table_drawer],
               flower_pot: params[:flower_pot],
               picture_frames: params[:picture_frames],
               sofa_stand: params[:sofa_stand],
               skirting: params[:skirting]
              }

    @colors.each do |key, value|
      target = @svg_file.at_css("#" + key.to_s)
      target['style'] = "color:#000000;fill:#{value};fill-opacity:1;stroke:none;stroke-width:0.5;marker:none;visibility:visible;display:inline;overflow:visible;enable-background:accumulate"
    end
    FileUtils::mkdir_p "#{Rails.root}/public/coloured_svgs/user_#{@user}/canva_#{@canva.id}"
    File.write("#{Rails.root}/public/coloured_svgs/user_#{@user}/canva_#{@canva.id}/sketch_#{@sketch.id}.svg", @svg_file.to_xml)

  end
end
