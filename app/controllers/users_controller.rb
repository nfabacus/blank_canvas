class UsersController < ApplicationController

  def show
    @user = current_user
    @canvases = @user.canva.all
  end


end
