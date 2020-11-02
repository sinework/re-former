class UsersController < ApplicationController
  include UsersHelper
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    redirect_to edit_user_path if @user.update(user_params)
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
