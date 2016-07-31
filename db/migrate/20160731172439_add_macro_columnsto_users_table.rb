class AddMacroColumnstoUsersTable < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.float   :weight_rate
      t.integer :workout_count
      t.float   :workout_intensity
      t.string  :workout_type
      t.integer :calories
      t.integer :protein
      t.integer :carbs
      t.integer :fat
      t.integer :notch
    end
  end
end
