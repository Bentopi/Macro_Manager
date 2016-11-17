class AddRecipeidToMealsTable < ActiveRecord::Migration[5.0]
  def change
    change_table :meals do |t|
      t.integer :recipe_id
    end
  end
end
