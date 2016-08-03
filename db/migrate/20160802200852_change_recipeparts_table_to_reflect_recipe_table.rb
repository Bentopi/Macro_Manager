class ChangeRecipepartsTableToReflectRecipeTable < ActiveRecord::Migration[5.0]
  def change
    change_table :recipeparts do |t|
      t.remove :meal_id
      t.integer :recipe_id
    end
  end
end
