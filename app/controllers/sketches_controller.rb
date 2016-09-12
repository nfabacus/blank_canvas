require 'nokogiri'
require 'nokogiri-styles'

class SketchesController < ApplicationController

  def create


    @svg_path = "#{Rails.root}" + "/public/images/room_#{params[:room_choice]}.svg"

    @svg_file = File.open(@svg_path) { |f| Nokogiri::HTML(f) }

    @sofa = params[:sofa]
    @cushion_one = params[:cushion_one]
    @cushion_two = params[:cushion_two]
    @room_wall = params[:room_wall]
    @room_floor = params[:room_floor]
    @lamp = params[:lamp]
    @carpet= params[:carpet]
    @coffee_table = params[:coffee_table]


    nodes = @svg_file.at_css("#sofa")
    nodes['class'] = '####'
    style = nodes.styles

      style['fill'] = '#000000'
      nodes.styles = style
      puts nodes
      puts '-'*40

    # style = @svg_file.styles
    # style['sofa.color'] = @sofa
    #
    # @svg_file.css("#sofa")['fill'] = @sofa




    @canva = Canva.find(params[:canva_id])
    @sketch = Sketch.new(sketch_params)
    @user = @canva.user_id
    redirect_to "/users/#{@user}"
  end

  private

  def sketch_params
    if params[:sketch].present?
      params.require(:sketch).permit(:sofa,:cushion_one,:cushion_two,:room_wall,:room_floor,:lamp,:carpet,:coffee_table)
    end
  end

end
