class MacrosController < ApplicationController

  before_action :except => [:guest_macros] do
    if @current_user.age.nil? || @current_user.weight.nil?
      redirect_to edit_profile_path, alert: "We're gonna need this info before Macros!"
    end
  end


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


  def notch_up
    @user = User.find_by id: session[:user_id]
    @user.notch += 0.1
    @user.save

    macroparser = MacroParser.new(@user.id)
    macroparser.parse!

    @user.fat = macroparser.fat
    @user.protein = macroparser.protein
    @user.carbs = macroparser.carbs
    @user.calories = macroparser.calories

    if @user.save
      redirect_to macros_path, notice: "Turned it up a notch!"
    else
      render :show, notice: "Something went wrong"
    end
  end


  def notch_down
    @user = User.find_by id: session[:user_id]
    @user.notch -= 0.1
    @user.save

    macroparser = MacroParser.new(@user.id)
    macroparser.parse!

    @user.fat = macroparser.fat
    @user.protein = macroparser.protein
    @user.carbs = macroparser.carbs
    @user.calories = macroparser.calories

    if @user.save
      redirect_to macros_path, notice: "Turned it down a notch!"
    else
      render :show, notice: "Something went wrong"
    end
  end


  def update
    @user = User.find_by id: session[:user_id]
    @user.weight_rate = params[:user][:weight_rate]
    @user.workout_count = params[:user][:workout_count]
    @user.workout_type = params[:user][:workout_type]
    @user.workout_intensity = params[:user][:workout_intensity]
    @user.notch = 0
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
