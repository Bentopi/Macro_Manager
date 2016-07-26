class WelcomeController < ApplicationController

  def home

    if params[:age] == "" || params[:weight] == ""
      redirect_to root_path, notice: "You left either Age or Weight blank"
    end

    macroparser = MacroParser.new(params)
    macroparser.parse!

    @fat = macroparser.fat
    @protein = macroparser.protein
    @carbs = macroparser.carbs
    @calories = macroparser.calories

    session[:macroparser_params] = params
  end
end
