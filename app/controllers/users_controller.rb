class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    user = User.create(user_params)
    if user
      login(user)
      redirect_to user_path(user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if session[:user_id] == nil
      flash[:error] = "Please log in"
      redirect_to login_path
    elsif @user == nil || @user.id != session[:user_id]
      redirect_to user_path(session[:user_id])
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    user = User.find_by(id: params[:id])
    user.update_attributes(user_params)
    redirect_to user_path user
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password)
  end

end
