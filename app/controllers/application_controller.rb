class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action do
    @current_user = User.find_by id: session[:user_id]
  end

  def authenticate_user!
    if @current_user.nil?
      session[:redirect_to] = request.url
      redirect_to sign_in_path, notice: "Please Sign In!"
    end


  end
end
