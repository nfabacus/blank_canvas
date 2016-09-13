require 'nokogiri'
require 'nokogiri-styles'

class SketchesController < ApplicationController
  include UpdateSVGWithColours

  def create
    @canva = Canva.find(params[:canva_id])
    @sketch = Sketch.new

    update_svg_with_colours

    File.open("#{Rails.root}"+"/public/coloured_svgs/#{@canva.id}.xml") do |f|
      @sketch.svg_file = f
      @sketch.save

      
    end

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
