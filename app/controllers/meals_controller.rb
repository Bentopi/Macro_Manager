class MealsController < ApplicationController

  before_action :authenticate_user!

  def show_meal
  @meal = Meal.find_by id: params[:id]
  end

  def show_ingredient
  @ingredient = Ingredient.find_by id: params[:id]
  end
end
