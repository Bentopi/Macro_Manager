class DropNameAndCategoryFromMealsTable < ActiveRecord::Migration[5.0]
  def change
    change_table :meals do |t|
      t.remove :category
    end
  end
end
