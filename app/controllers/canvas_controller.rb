class CanvasController < ApplicationController



  def index
    @canva = Canva.new
  end

  def new

  end

  def create
    @canva = Canva.new(canvas_params)
    @svg = inline_svg('public/images/test.svg')
  end

  def canvas_params
    params.require(:canva).permit(:svg)
  end

  def inline_svg(path)
    File.open(path) do |file|
    file.read
  end
end



end
