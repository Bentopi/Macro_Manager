class MealplanController < ApplicationController

  before_action do

    if @current_user.nil?
      redirect_to sign_in_path, alert: "Please sign in if you want a meal plan"

    # no_macros = {"controller"=>"welcome", "action"=>"home"}
    # redirect_to , notice: "You have to calculate macros first!" unless session[:macroparser_params] != no_macros
    end
  end

  def new


    p = ActiveSupport::HashWithIndifferentAccess.new session[:macroparser_params]

    macroparser = MacroParser.new(p)
    macroparser.parse!

    @fat = macroparser.fat
    @protein = macroparser.protein
    @carbs = macroparser.carbs
    @calories = macroparser.calories

  end
end
