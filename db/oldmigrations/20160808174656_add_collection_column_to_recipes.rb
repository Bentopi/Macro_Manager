class AddCollectionColumnToRecipes < ActiveRecord::Migration[5.0]
  def change
    change_table :recipes do |t|
      t.string :collection
    end
  end
end
