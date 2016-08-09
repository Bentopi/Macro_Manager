class MealplanParser
  attr_reader :params, :calories, :protein, :carbs, :fat

  def initialize(user_id)
    @current_user = User.find_by id: user_id
    @calories = @current_user.calories
  end

  def number_of_mealplans(collection)
    array_size = Recipe.where(collection: collection, category: "Breakfast").size
    0.upto(array_size - 1).to_a
  end

  def generate_collection!(collection)

    mealplan_total = number_of_mealplans(collection)

    mealplan_total.each do |n|
      @mealplan = Mealplan.create
      mealplan_number = @current_user.mealplans.size + 1
      @mealplan = Mealplan.new
      @mealplan.user_id = @current_user.id
      @mealplan.name = "#{collection} Day #{n+1}"

      if @mealplan.save
        meal_kcals = @current_user.calories

        lunch_kcals = (meal_kcals * 0.33).round(-2)
        breakfast_kcals = (meal_kcals - lunch_kcals - 150) / 2
        dinner_kcals = breakfast_kcals

        breakfast_quantity = 1
        breakfast_select = (Recipe.where category: "Breakfast")[n]

        lunch_quantity = (lunch_kcals / 100)
        lunch_select = (Recipe.where category: "Lunch")[n]

        dinner_quantity = 1
        dinner_select = (Recipe.where category: "Dinner")[n]


        while breakfast_kcals >= (breakfast_select.kcals * breakfast_quantity)
          breakfast_quantity +=1
        end
        if breakfast_quantity <= 1
          breakfast = Meal.create! mealplan_id: @mealplan.id, recipe_id: breakfast_select.id, quantity: (breakfast_quantity)
        else
          breakfast = Meal.create! mealplan_id: @mealplan.id, recipe_id: breakfast_select.id, quantity: (breakfast_quantity - 1)
        end
        breakfast_remaining_kcals = breakfast_kcals - breakfast.kcals


        lunch = Meal.create! mealplan_id: @mealplan.id, recipe_id: lunch_select.id, quantity: lunch_quantity



        while dinner_kcals >= (dinner_select.kcals * dinner_quantity)
          dinner_quantity +=1
        end
        if dinner_quantity <= 1
          dinner = Meal.create! mealplan_id: @mealplan.id, recipe_id: dinner_select.id, quantity: (dinner_quantity)
        else
          dinner = Meal.create! mealplan_id: @mealplan.id, recipe_id: dinner_select.id, quantity: (dinner_quantity - 1)
        end
        dinner_remaining_kcals = dinner_kcals - dinner.kcals

        remaining_kcals = breakfast_remaining_kcals + dinner_remaining_kcals

        snacks_choice = (Recipe.where category: "Snacks").first
        protein_choice = (Recipe.where category: "Protein Shake").first

        protein = Meal.create! mealplan_id: @mealplan.id, recipe_id: protein_choice.id, quantity: 1

        snacks_quantity = (remaining_kcals / 100).to_i

        if snacks_quantity > 0
          snacks = Meal.create! mealplan_id: @mealplan.id, recipe_id: snacks_choice.id, quantity: snacks_quantity
        end
      end
    end
  end

  def generate!(mealplan_id)
    meal_kcals = @current_user.calories

    lunch_kcals = (meal_kcals * 0.33).round(-2)
    breakfast_kcals = (meal_kcals - lunch_kcals - 150) / 2
    dinner_kcals = breakfast_kcals

    breakfast_quantity = 1
    breakfast_select = (Recipe.where category: "Breakfast").sample

    lunch_quantity = (lunch_kcals / 100)
    lunch_select = (Recipe.where category: "Lunch").sample

    dinner_quantity = 1
    dinner_select = (Recipe.where category: "Dinner").sample


    while breakfast_kcals >= (breakfast_select.kcals * breakfast_quantity)
      breakfast_quantity +=1
    end
    if breakfast_quantity <= 1
      breakfast = Meal.create! mealplan_id: mealplan_id, recipe_id: breakfast_select.id, quantity: (breakfast_quantity)
    else
      breakfast = Meal.create! mealplan_id: mealplan_id, recipe_id: breakfast_select.id, quantity: (breakfast_quantity - 1)
    end
    breakfast_remaining_kcals = breakfast_kcals - breakfast.kcals


    lunch = Meal.create! mealplan_id: mealplan_id, recipe_id: lunch_select.id, quantity: lunch_quantity



    while dinner_kcals >= (dinner_select.kcals * dinner_quantity)
      dinner_quantity +=1
    end
    if dinner_quantity <= 1
      dinner = Meal.create! mealplan_id: mealplan_id, recipe_id: dinner_select.id, quantity: (dinner_quantity)
    else
      dinner = Meal.create! mealplan_id: mealplan_id, recipe_id: dinner_select.id, quantity: (dinner_quantity - 1)
    end
    dinner_remaining_kcals = dinner_kcals - dinner.kcals

    remaining_kcals = breakfast_remaining_kcals + dinner_remaining_kcals

    snacks_choice = (Recipe.where category: "Snacks").first
    protein_choice = (Recipe.where category: "Protein Shake").first

    protein = Meal.create! mealplan_id: mealplan_id, recipe_id: protein_choice.id, quantity: 1

    snacks_quantity = (remaining_kcals / 100).to_i

    if snacks_quantity > 0
      snacks = Meal.create! mealplan_id: mealplan_id, recipe_id: snacks_choice.id, quantity: snacks_quantity
    end
  end

end
