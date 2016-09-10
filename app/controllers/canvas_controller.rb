class CanvasController < ApplicationController
  include CreateColourPalette

  def index

  end

  def new
    @canva = Canva.new
    @choice = params[:selection]
  end

  def create
    @canva = Canva.new(canva_params)
      if @canva.save
      redirect_to "/canvas/#{@canva.id}?selection=#{params[:selection]}"
      else
      flash[:notice] = "Please select a valid picture"
      redirect_to "/canvas/new?selection=#{params[:selection]}"
    end
  end



  private

  def canva_params
    if params[:canva].present?
      params.require(:canva).permit(:image, :selection)
    end
  end

end
