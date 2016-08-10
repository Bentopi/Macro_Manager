class SessionsController < ApplicationController

  def create
    user = User.find_by email: params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      path = session[:redirect_to] || root_path
      session.delete(:redirect_to)
      redirect_to path, notice: 'Welcome Back!'
    else
      flash.now[:alert] = "Email or Password does not match records"
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path, notice: "Signed Out!"
  end
end
