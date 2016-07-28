class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.gender = params[:user][:gender]
    @user.height = (params[:height_ft].to_f * 12) + params[:height_in].to_f

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You're good to go!"
    else
      render :new
    end
  end
end
