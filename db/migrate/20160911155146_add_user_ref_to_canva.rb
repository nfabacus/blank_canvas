class AddUserRefToCanva < ActiveRecord::Migration
  def change
    add_reference :canvas, :user, index: true, foreign_key: true
  end
end
