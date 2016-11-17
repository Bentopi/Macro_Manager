class Createrecipeparttable < ActiveRecord::Migration[5.0]
  def change
    create_table :recipeparts do |t|
      t.integer :ingredient_id
      t.integer :meal_id
      t.integer :amount

      t.timestamps
    end
  end
end
