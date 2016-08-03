class Recipe < ActiveRecord::Base
  has_many :recipeparts
  has_many :ingredients, through: :recipeparts

  def kcals
    recipeparts.map {|r| r.kcals}.sum
  end

  def proteins
    recipeparts.map {|r| r.proteins}.sum
  end

  def carbs
    recipeparts.map {|r| r.carbs}.sum
  end

  def fats
    recipeparts.map {|r| r.fats}.sum
  end
end
