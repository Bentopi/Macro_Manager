class Meal < ActiveRecord::Base
  belongs_to :recipe
  has_many :recipes

  def kcals
    recipes.map {|r| r.kcals}.sum
  end

  def proteins
    recipes.map {|r| r.proteins}.sum
  end

  def carbs
    recipes.map {|r| r.carbs}.sum
  end

  def fats
    recipes.map {|r| r.fats}.sum
  end

end
