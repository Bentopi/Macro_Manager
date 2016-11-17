class CreateFavoritesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.string :name
      t.string :brand
      t.float :calories
      t.float :protein
      t.float :carbs
      t.float :fat
      t.string :serving
      t.integer :user_id
    end
  end
end
