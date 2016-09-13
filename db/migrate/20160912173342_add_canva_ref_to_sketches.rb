class AddCanvaRefToSketches < ActiveRecord::Migration
  def change
    add_reference :sketches, :canva, index: true, foreign_key: true
  end
end
