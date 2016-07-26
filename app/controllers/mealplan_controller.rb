class MealplanController < ApplicationController

  before_action do
    no_macros = {"controller"=>"welcome", "action"=>"home"}
    redirect_to root_path, notice: "You have to calculate macros first!" unless session[:macroparser_params] != no_macros
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
