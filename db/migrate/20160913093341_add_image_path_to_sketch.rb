class AddImagePathToSketch < ActiveRecord::Migration
  def change
    add_column :sketches, :image_path, :string
  end
end
