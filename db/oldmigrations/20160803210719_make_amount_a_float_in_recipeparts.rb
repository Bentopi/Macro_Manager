class MakeAmountAFloatInRecipeparts < ActiveRecord::Migration[5.0]
  def change
    change_table :recipeparts do |t|
      t.remove :amount
      t.float :amount
    end
  end
end
