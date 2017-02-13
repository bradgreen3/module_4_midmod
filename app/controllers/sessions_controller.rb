class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash.now[:success] = "Logged in!"
      redirect_to links_path
    else
      flash.now[:danger] = "Invalid account information"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end


end
