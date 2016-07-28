class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by email: params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Welcome Back!'
    else
      flash.now[:alert] = "Email or Password does not match records"
      render :new
    end
  end


  def delete
    reset_session
    redirect_to root_path, notice: "Signed out!"
  end
end
