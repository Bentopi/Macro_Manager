class MacrosController < ApplicationController

  def guest_macros

    if params[:age] == "" || params[:weight] == ""
      redirect_to guest_macros_path, notice: "You left either Age or Weight blank"
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
