class CanvasController < ApplicationController



  def index

  end

  def new
    @choice = params[:selection]
  end

  def create
    @canva = Canva.new(canvas_params)
  end

  def canvas_params
    params.require(:canva).permit(:avatar)
  end



end
