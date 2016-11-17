class MakeWorkoutTypeDefaulttoF < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :workout_type, :string, default: "L"
  end
end
