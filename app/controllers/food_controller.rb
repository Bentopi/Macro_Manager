class FoodController < ApplicationController

  def finder

  end

  def search

    puts "============"
    puts params
    puts "============"

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
        @food_weight = details["food"]["servings"]["serving"]["metric_serving_amount"].to_i
        @food_weight_unit = details["food"]["servings"]["serving"]["metric_serving_unit"]
      end

      render :finder
  end
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
