require 'mini_magick'

class CanvasController < ApplicationController
  include CreateColourPalette
  include ValidPhoto
  include DirectMeWisely
  include CheckForParamPresence

  def index

  end

  def new
    @canva = Canva.new
    @svg = params[:room_choice]
  end

  def create
    @svg = params[:room_choice]
    @canva = Canva.create(canva_params)
    direct_me_wisely
  end

  def show
    @svg = params[:room_choice]
    @canva = Canva.find(params[:id])
    @color = create_palette
  end

  def update
    @svg = params[:room_choice]
    @canva = Canva.find(params[:id])
    check_for_param_presence
    direct_me_wisely
  end

  private

  def canva_params
    if params[:canva].present?
      params.require(:canva).permit(:image, :room_choice)
    end
  end

end
