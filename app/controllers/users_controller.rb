class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    user = User.create(user_params)
    redirect_to user_path user.username
  end

  def show
    @user = User.find_by(username: params[:user_name])
  end

  def edit
    @user = User.find_by(username: params[:user_name])
  end

  def update
    user = User.find_by(username: params[:user_name])
    user.update_attributes(user_params)
    redirect_to user_path(user.username)
  end

  def destroy
    user = User.find_by(username: params[:user_name])
    user.destroy
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password)
  end

end
