require 'RMagick'

class CanvasController < ApplicationController
  include CreateColourPalette
  include ValidPhoto

  def new
    @canva = Canva.new
    @svg = params[:room_choice]
  end

  def create
    svg = params[:room_choice]
    @canva = Canva.create(canva_params)
    if @canva.save && valid_photo?
      redirect_to canva_path(@canva, room_choice: svg)

    else
      flash[:notice] = "Please select a valid picture"
      redirect_to new_canva_path(room_choice: svg)
    end

  end

  def show
    @svg = params[:room_choice]
    @canva = Canva.find(params[:id])
    @color = create_palette
  end


  private

  def canva_params
    if params[:canva].present?
      params.require(:canva).permit(:image, :room_choice)
    end
  end

end
