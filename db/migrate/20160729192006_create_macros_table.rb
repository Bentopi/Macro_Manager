class CreateMacrosTable < ActiveRecord::Migration[5.0]
  def change
      create_table :macrosets do |t|
        t.integer :workout_count
        t.integer :workout_intensity
        t.string :exercise_type
        t.integer :calories
        t.integer :protein
        t.integer :carbs
        t.integer :fat
        t.integer :user_id
        t.integer :notch

        t.timestamps
      end
    end
end
