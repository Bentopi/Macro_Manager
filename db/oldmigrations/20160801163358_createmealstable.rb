class Createmealstable < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.integer :mealplan_id
      t.string :name
      t.timestamps
    end
  end
end
