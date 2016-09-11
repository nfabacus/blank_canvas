class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @canva = @user.canva.all
  end
end
