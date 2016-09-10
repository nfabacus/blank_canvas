require 'RMagick'

class CanvasController < ApplicationController
  include CreateColourPalette
  include ValidPhoto

  def index

  end

  def new
    @canva = Canva.new
    @choice = params[:selection]
  end

  def show
    @choice = params[:selection]
    @canva = Canva.find(params[:id])
    @color = create_palette
  end

  def create
    @canva = Canva.create(canva_params)

    if @canva.save && valid_photo?
      redirect_to "/canvas/#{@canva.id}?selection=#{params[:selection]}"
    else
      flash[:notice] = "Please select a valid picture"
      redirect_to "/canvas/new?selection=#{params[:selection]}"
    end
      # flash[:notice] = "Please select a valid picture"
      # redirect_to "/canvas/new?selection=#{params[:selection]}"
  end

  def update

  end

  private

  def canva_params
    if params[:canva].present?
      params.require(:canva).permit(:image, :selection)
    end
  end

end
