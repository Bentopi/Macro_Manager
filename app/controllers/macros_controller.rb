class MacrosController < ApplicationController

  def guest_macros

    if params[:age] == "" || params[:weight] == ""
      redirect_to guest_macros_path, notice: "You left either Age or Weight blank"
    end

    macroparser = GuestMacroParser.new(params)
    macroparser.parse!

    @fat = macroparser.fat
    @protein = macroparser.protein
    @carbs = macroparser.carbs
    @calories = macroparser.calories

  end

  def show
    @user = User.find_by id: session[:user_id]
  end

  def new
    @user = User.find_by id: session[:user_id]
  end

  def update
    @user = User.find_by id: session[:user_id]
    @user.weight_rate = params[:user][:weight_rate]
    @user.workout_count = params[:user][:workout_count]
    @user.workout_type = params[:user][:workout_type]
    @user.workout_intensity = params[:user][:workout_intensity]
    @user.save

    macroparser = MacroParser.new(@user.id)
    macroparser.parse!

    @user.fat = macroparser.fat
    @user.protein = macroparser.protein
    @user.carbs = macroparser.carbs
    @user.calories = macroparser.calories

    if @user.save
      redirect_to macros_path, notice: "Hooray! You got Macros!"
    else
      render :edit
    end
  end

  def edit
    @user = User.find_by id: session[:user_id]
  end



end
