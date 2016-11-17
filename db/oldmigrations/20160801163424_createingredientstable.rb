class Createingredientstable < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.integer :serving_amount
      t.string :serving_name
      t.integer :calories
      t.integer :protein
      t.integer :fat
      t.integer :carbs

      t.timestamps
    end
  end
end
