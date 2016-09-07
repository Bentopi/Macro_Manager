class RemoveUseridFromRecipes < ActiveRecord::Migration[5.0]
  def change
    change_table :recipes do |t|
      t.remove :user_id
    end
  end
end
