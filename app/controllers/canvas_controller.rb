class CanvasController < ApplicationController
  include CreateColourPalette

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
    #if !params[:image].blank?
    @canva = Canva.create(canva_params)
    if @canva.save
      redirect_to "/canvas/#{@canva.id}?selection=#{params[:selection]}"
    else
      flash[:notice] = "Please select correct format of a picture"
      redirect_to "canvas/new"
    end
  end

  private

  def canva_params
    if params[:canva].present?
      params.require(:canva).permit(:image, :selection)
    end
  end

end
