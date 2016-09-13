require 'nokogiri'
require 'nokogiri-styles'
require 'fileutils'




class SketchesController < ApplicationController
  include UpdateSVGWithColours

  def create
    @canva = Canva.find(params[:canva_id])
    @sketch = Sketch.create
    @user = @canva.user_id

    update_svg_with_colours

    @sketch.image_path="/coloured_svgs/user_#{@user}/canva_#{@canva.id}/sketch_#{@sketch.id}.svg"

    @sketch.save
    @canva.sketches << @sketch


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
