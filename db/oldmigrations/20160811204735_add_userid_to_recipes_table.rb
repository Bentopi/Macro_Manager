class AddUseridToRecipesTable < ActiveRecord::Migration[5.0]
  def change
    change_table :recipes do |t|
      t.integer :user_id
    end
  end
end
