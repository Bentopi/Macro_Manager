class ChangeAmounttoFloatinIngredients < ActiveRecord::Migration[5.0]
  def change
    change_table :ingredients do |t|
      t.remove :serving_amount
      t.float :serving_amount
    end
  end
end
