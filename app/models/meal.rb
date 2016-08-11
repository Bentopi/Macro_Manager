class Meal < ActiveRecord::Base
  belongs_to :recipe
  has_many :recipes


  def kcals
   recipe_id = self.recipe_id
   recipe = Recipe.where id: recipe_id
   recipe.first.kcals * quantity
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
