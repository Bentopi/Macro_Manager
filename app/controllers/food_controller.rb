class FoodController < ApplicationController

  before_action :authenticate_user!

  def mealcenter
  end

  def favorites
    @favorites = Recipe.where category: (@current_user.id).to_s
  end

  def delete_favorite
    @recipe = Recipe.find_by category: (@current_user.id).to_s
    @recipepart = Recipepart.find_by recipe_id: @recipe.id
    @ingredient = Ingredient.find_by id: @recipepart.ingredient_id

    @ingredient.destroy
    @recipe.destroy
    @recipepart.destroy

    redirect_to favorites_path, notice: "Favorite Deleted"
  end

  def finder
  end

  def recipe_collections
    @recipes = Recipe.where.not("category ~* ?", "^[0-9]")
  end

  def search

    response = JSON.parse(Food.search(params[:query]))

    if response["foods"]["total_results"] == "0"
      redirect_to food_finder_path, notice: "Food not found!"
    else

      if response["foods"]["food"].kind_of?(Array)
        food_id = response["foods"]["food"].first["food_id"]
        @food_brand = response["foods"]["food"].first["brand_name"]
        @food_name = response["foods"]["food"].first["food_name"]
      else
        food_id = response["foods"]["food"]["food_id"]
        @food_brand = response["foods"]["food"]["brand_name"]
        @food_name = response["foods"]["food"]["food_name"]
      end

      details = JSON.parse(Food.get(food_id))

      if details["food"]["servings"]["serving"].kind_of?(Array)
        @food_calories = details["food"]["servings"]["serving"][0]["calories"].to_i
        @food_protein = details["food"]["servings"]["serving"][0]["protein"].to_i
        @food_carbohydrate = details["food"]["servings"]["serving"][0]["carbohydrate"].to_i
        @food_fat = details["food"]["servings"]["serving"][0]["fat"].to_i
        @food_serving = details["food"]["servings"]["serving"][0]["serving_description"]
        @food_weight = details["food"]["servings"]["serving"][0]["metric_serving_amount"].to_i
        @food_weight_unit = details["food"]["servings"]["serving"][0]["metric_serving_unit"]

      else
        @food_serving = details["food"]["servings"]["serving"]["serving_description"]
        @food_calories = details["food"]["servings"]["serving"]["calories"].to_i
        @food_protein = details["food"]["servings"]["serving"]["protein"].to_i
        @food_carbohydrate = details["food"]["servings"]["serving"]["carbohydrate"].to_i
        @food_fat = details["food"]["servings"]["serving"]["fat"].to_i
        @food_serving = details["food"]["servings"]["serving"]["serving_description"]
        @food_weight = details["food"]["servings"]["serving"]["metric_serving_amount"].to_i
        @food_weight_unit = details["food"]["servings"]["serving"]["metric_serving_unit"]
      end

      render :finder
    end
  end

  def add_favorite
    @ingredient = Ingredient.new
    @ingredient.serving_amount = 1
    @ingredient.serving_name = params[:serving]
    @ingredient.calories = params[:calories]
    @ingredient.protein = params[:protein]
    @ingredient.carbs = params[:carbs]
    @ingredient.fat = params[:fat]
    name = "#{params[:brand]} #{params[:name]}"
    @ingredient.name = name
    @ingredient.save


    @recipe = Recipe.new
    @recipe.category = (@current_user.id).to_s
    @recipe.name = name
    @recipe.description = "One of your favorite foods! Fit it into your Meal Plans!"
    @recipe.collection = "Favorites"
    @recipe.save


    @recipepart = Recipepart.new
    @recipepart.ingredient_id = @ingredient.id
    @recipepart.recipe_id = @recipe.id
    @recipepart.amount = 1
    @recipepart.save


    if params[:name] =~ /^\s*$/
      redirect_to food_finder_path, notice: "You didn't seach anything"
    elsif @ingredient.save && @recipe.save && @recipepart.save
      redirect_to food_finder_path, notice: "Added #{@ingredient.name} to your favorites!"
    else
      redirect_to food_finder_path, notice: "Something went wrong"
    end
  end

  def show_meal
    @meal = Meal.find_by id: params[:id]
  end

  def show_recipe
    @recipe = Recipe.find_by id: params[:id]
  end

  def show_ingredient
    @ingredient = Ingredient.find_by id: params[:id]
  end

end

#stuff I might need for making the servings dropdown ###
# @food_info = details["food"]["servings"]["serving"]
# serving_description, calories, protein, carbohydrate, fat, metric_serving_amount, metric_serving_unit = [], [], [], [], [], [], []
#
# @food_info.each do |food|
#   serving_description << food["serving_description"]
#   calories << food["calories"]
#   protein << food["protein"]
#   carbohydrate << food["carbohydrate"]
#   fat << food["fat"]
#   metric_serving_amount << food["metric_serving_amount"]
#   metric_serving_unit << food["metric_serving_unit"]
# end
