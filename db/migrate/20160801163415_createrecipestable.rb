class Createrecipestable < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.integer :ingredient_id
      t.integer :meal_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
