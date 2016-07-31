class Changecolumnnameinmacroplantable < ActiveRecord::Migration[5.0]
  def change
    change_table :macroplans do |t|
      t.remove :exercise_type
      t.string :workout_type
    end
  end
end
