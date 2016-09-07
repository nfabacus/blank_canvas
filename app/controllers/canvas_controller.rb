class CanvasController < ApplicationController

  def index

  end

  def new
    @canva = Canva.new
  end

  def show
    @canva = Canva.find(params[:id])
  end

  def create
    @canva = Canva.new(params[:image])
    redirect_to "show"
  end

end
