class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
        t.string :email
        t.string :username
        t.integer :age
        t.integer :height
        t.string :gender
        t.float :weight
        t.string :password_digest
        t.float   :weight_rate
        t.integer :workout_count
        t.float   :workout_intensity
        t.string  :workout_type, default: "L"
        t.integer :calories
        t.integer :protein
        t.integer :carbs
        t.integer :fat
        t.integer :notch, default: 1

        t.timestamps
    end
  end
end
