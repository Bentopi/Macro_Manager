class TidyMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
        t.string  :email
        t.string  :username
        t.string  :password_digest
        t.integer :age
        t.integer :height
        t.string  :gender
        t.float   :weight
        t.string  :weight_rate
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

    create_table :ingredients do |t|
      t.string   :serving_name
      t.integer  :calories
      t.integer  :protein
      t.integer  :fat
      t.integer  :carbs
      t.string   :name
      t.float    :serving_amount

      t.timestamps
    end

    create_table :mealplans do |t|
      t.integer  :user_id
      t.string   :name

      t.timestamps
    end

    create_table :meals do |t|
      t.integer  :mealplan_id
      t.string   :name
      t.integer  :recipe_id
      t.float    :quantity

      t.timestamps

    end

    create_table :recipeparts do |t|
      t.integer  :ingredient_id
      t.integer  :recipe_id
      t.float    :amount

      t.timestamps
    end

    create_table :recipes do |t|
      t.string   :category
      t.string   :name
      t.text     :description
      t.string   :collection

      t.timestamps
    end
  end
end
