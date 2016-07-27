class FoodController < ApplicationController

  def list

  end

  def search

    response = JSON.parse(Food.search(params[:query]))

    food_id = response["foods"]["food"].first["food_id"]

    details = JSON.parse(Food.get(food_id))

    @food_brand = response["foods"]["food"].first["brand_name"]
    @food_name = response["foods"]["food"].first["food_name"]


    if details["food"]["servings"]["serving"].kind_of?(Array)

      @food_info = details["food"]["servings"]["serving"]
      serving_description, calories, protein, carbohydrate, fat, metric_serving_amount, metric_serving_unit = [], [], [], [], [], [], []

      @food_info.each do |food|
        serving_description << food["serving_description"]
        calories << food["calories"]
        protein << food["protein"]
        carbohydrate << food["carbohydrate"]
        fat << food["fat"]
        metric_serving_amount << food["metric_serving_amount"]
        metric_serving_unit << food["metric_serving_unit"]
      end

      @food_calories = details["food"]["servings"]["serving"][0]["calories"]
      @food_protein = details["food"]["servings"]["serving"][0]["protein"]
      @food_carbohydrate = details["food"]["servings"]["serving"][0]["carbohydrate"]
      @food_fat = details["food"]["servings"]["serving"][0]["fat"]
      @food_serving = details["food"]["servings"]["serving"][0]["serving_description"]
      @food_weight = details["food"]["servings"]["serving"][0]["metric_serving_amount"].to_i
      @food_weight_unit = details["food"]["servings"]["serving"][0]["metric_serving_unit"]

    else
      @food_serving = details["food"]["servings"]["serving"]["serving_description"]
      @food_calories = details["food"]["servings"]["serving"]["calories"]
      @food_protein = details["food"]["servings"]["serving"]["protein"]
      @food_carbohydrate = details["food"]["servings"]["serving"]["carbohydrate"]
      @food_fat = details["food"]["servings"]["serving"]["fat"]
      @food_weight = details["food"]["servings"]["serving"]["metric_serving_amount"].to_i
      @food_weight_unit = details["food"]["servings"]["serving"]["metric_serving_unit"]
    end

    render :list
  end

end


#
#
# @food_serving = details["food"]["servings"]["serving"]["serving_description"]
# @food_calories = details["food"]["servings"]["serving"]["calories"]
# @food_protein = details["food"]["servings"]["serving"]["protein"]
# @food_carbohydrate = details["food"]["servings"]["serving"]["carbohydrate"]
# @food_fat = details["food"]["servings"]["serving"]["fat"]
# @food_weight = details["food"]["servings"]["serving"]["metric_serving_amount"].to_i
# @food_weight_unit = details["food"]["servings"]["serving"]["metric_serving_unit"]
