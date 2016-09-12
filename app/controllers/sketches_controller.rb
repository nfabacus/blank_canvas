class SketchesController < ApplicationController

  def create
    @canva = current_user.canva.last
    @sketch = Sketch.new(sketch_params)

  end

  private

  def sketch_params
    if params[:sketch].present?
      params.require(:sketch).permit(:sofa,:cushion_one,:cushion_two,:room_wall,:room_floor,:lamp,:carpet,:coffee_table)
    end
  end

end
