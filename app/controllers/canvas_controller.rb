class CanvasController < ApplicationController

  def index

  end

  def new
    @canva = Canva.new
  end

  def show
    @canva = Canva.first
    <% console %>
  end

  def create
    @canva = Canva.create(canva_params)
    redirect_to "/canvas/#{@canva.id}"
  end

  private

  def canva_params
    params.require(:canva).permit(:image)
  end

end
