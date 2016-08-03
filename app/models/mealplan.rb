class Mealplan < ActiveRecord::Base
  belongs_to :user
  has_many :meals

  def kcals
    meal_ids = meals.pluck(:recipe_id)
    recipes = Recipe.where id: meal_ids
    recipes.map(&:kcals).sum

    recipe_stats = meals.map do |meal|
      { quantity: meal.quantity, kcals: meal.recipe.kcals }
    end

    recipe_stats.map { |s| s[:quantity] * s[:kcals] }.sum
  end

  def proteins
    meal_ids = meals.pluck(:recipe_id)
    recipes = Recipe.where id: meal_ids
    recipes.map(&:proteins).sum

    recipe_stats = meals.map do |meal|
      { quantity: meal.quantity, proteins: meal.recipe.proteins }
    end

    recipe_stats.map { |s| s[:quantity] * s[:proteins] }.sum
  end

  def carbs
    meal_ids = meals.pluck(:recipe_id)
    recipes = Recipe.where id: meal_ids
    recipes.map(&:carbs).sum

    recipe_stats = meals.map do |meal|
      { quantity: meal.quantity, carbs: meal.recipe.carbs }
    end

    recipe_stats.map { |s| s[:quantity] * s[:carbs] }.sum
  end

  def fats
    meal_ids = meals.pluck(:recipe_id)
    recipes = Recipe.where id: meal_ids
    recipes.map(&:fats).sum

    recipe_stats = meals.map do |meal|
      { quantity: meal.quantity, fats: meal.recipe.fats }
    end

    recipe_stats.map { |s| s[:quantity] * s[:fats] }.sum
  end

end
