class ChangeMealsQuantityToFloat < ActiveRecord::Migration[5.0]
  def change
    change_table :meals do |t|
      t.remove :quantity
      t.float :quantity
    end
  end
end
