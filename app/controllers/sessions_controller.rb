class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.confirm(params)
    if @user
      login(@user)
      flash[:notice] = "Successfully logged in."
      redirect_to user_path(@user)
    else
      flash[:error] = "Incorrect username or password."
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end

end
