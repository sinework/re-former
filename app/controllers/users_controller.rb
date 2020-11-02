class UsersController < ApplicationController
  include UsersHelper
  def new
    @user= User.new
  end
  def create
      @user = User.new(user_params)

      if @user.save
          redirect_to new_user_path
        else
          redirect_to new_user_path, alert: "Error creating user."
        end
  end
  # def create
  #   @user = User.new(username: params[:username], email: params[:email], password: params[:password])

  #   if @user.save
  #     redirect_to new_user_path
  #   else
  #     redirect_to new_user_path, alert: 'Error creating user.'
  #   end
  # end
  def edit
    @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
 
  if @user.update(user_params)
    redirect_to edit_user_path
  end
end
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
