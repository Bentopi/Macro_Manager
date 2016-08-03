class Recipepart < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe

  def kcals
    ingredient.calories * amount
  end

  def proteins
    ingredient.protein * amount
  end

  def carbs
    ingredient.carbs * amount
  end

  def fats
    ingredient.fat * amount
  end
end
