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
    @user.gender = "M"
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_profile_path, notice: "You're almost done! We need your stats"
    else
      render :new
    end
  end

  def profile
    @user = User.find_by id: session[:user_id]
  end

  def edit_profile
    @user = User.find_by id: session[:user_id]
  end

  def update_profile
    @user = User.find_by id: session[:user_id]
    @user.age = params[:user][:age]
    @user.weight = params[:user][:weight]
    @user.gender = params[:user][:gender]
    @user.height = params[:user][:height]
    if @user.save
      redirect_to user_profile_path, notice: "Your info has been saved"
    else
      render :edit
    end
  end

end
