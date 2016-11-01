class SessionsController < ApplicationController

  before_action :forbid_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params[:sessions][:username])
    if user
      if user.authenticate(params[:sessions][:password])
        session[:user_id] = user.id
        redirect_to :root
      else
        flash[:warning] = "Incorrect password!"
        render :new
      end
    else
      flash[:warning] = "User does not exist!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You've been successfully loggged out :)"
    redirect_to :root
  end

end
