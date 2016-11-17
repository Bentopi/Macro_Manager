class Changemealstable < ActiveRecord::Migration[5.0]
  def change
    change_table :meals do |t|
      t.string  :category
      t.integer :quantity
    end
  end
end
