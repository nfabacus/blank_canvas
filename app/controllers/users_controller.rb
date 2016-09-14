class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @canvases = @user.canva.all
  end


end
