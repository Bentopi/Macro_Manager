class MealplansController < ApplicationController

  before_action do
    if @current_user.nil?
      redirect_to sign_in_path, alert: "Please sign in if you want a Meal Plan"
    elsif @current_user.age == nil
      redirect_to edit_profile_path, alert: "We're gonna need this info if you want a Meal Plan!"
    elsif @current_user.protein == nil
      redirect_to edit_macros_path, alert: "You gotta get Macros if you want a Meal Plan!"
    end
  end

  def list
    @mealplans = @current_user.mealplans
  end

  def new
    mealplan_number = @current_user.mealplans.size + 1
    @mealplan = Mealplan.new
    @mealplan.user_id = @current_user.id
    @mealplan.name = "Day #{mealplan_number}"

    if @mealplan.save
      redirect_to edit_mealplan_path(id: @mealplan.id)
    else
      flash[:notice] = "Something went wrong"
      render :list
    end
  end

  def show
    @mealplan = Mealplan.find_by id: params[:id]
  end

  def edit
    @mealplan = Mealplan.find_by id: params[:id]
    @meals = @mealplan.meals
  end

  def delete_mealplan
    @mealplan = Mealplan.find_by id: params[:id]
    @mealplan.destroy
    redirect_to mealplans_path, notice: "Mealplan Deleted"
  end

  def add_meal
    @mealplan = Mealplan.find_by id: params[:id]
    @new_meal = Meal.new
    @new_meal.mealplan_id = @mealplan.id
    @new_meal.recipe_id = params[:mealplan][:meals]
    @new_meal.quantity = 1

    if @new_meal.save
      redirect_to edit_mealplan_path, notice: "Great! Add Another Meal"
    else
      flash[:notice] = "Something went wrong"
      render :edit
    end
  end

  def delete_meal
    @meal = Meal.find_by id: params[:meal_id]
    @meal.destroy
    redirect_to edit_mealplan_path(params[:id]), notice: "Meal Deleted"
  end

  def generate
    @mealplan = Mealplan.find_by id: params[:id]
    breakfast_kcals = @current_user.calories * 0.25
    lunch_kcals = @current_user.calories * 0.4
    dinner_kcals = @current_user.calories * 0.35


    breakfast_quantity = 1
    breakfast_select = (Recipe.where category: "Breakfast").sample
    breakfast_choice = breakfast_select

    lunch_quantity = 1
    lunch_select = (Recipe.where category: "Lunch").sample
    lunch_choice = lunch_select

    dinner_quantity = 1
    dinner_select = (Recipe.where category: "Dinner").sample
    dinner_choice = dinner_select

    snacks_quantity = 1
    snacks_select = (Recipe.where category: "Snacks").sample
    snacks_choice = snacks_select

    while breakfast_kcals >= (breakfast_select.kcals * breakfast_quantity)
      breakfast_quantity +=1
    end
    breakfast = Meal.create! mealplan_id: @mealplan.id, recipe_id: breakfast_select.id, quantity: (breakfast_quantity - 1)
    breakfast_remaining = breakfast_kcals - breakfast.kcals

    while lunch_kcals >= (lunch_select.kcals * lunch_quantity)
      lunch_quantity +=1
    end
      lunch = Meal.create! mealplan_id: @mealplan.id, recipe_id: lunch_select.id, quantity: (lunch_quantity - 1)
      lunch_remaining = lunch_kcals - lunch.kcals

    while dinner_kcals >= (dinner_select.kcals * dinner_quantity)
      dinner_quantity +=1
    end
    dinner = Meal.create! mealplan_id: @mealplan.id, recipe_id: dinner_select.id, quantity: (dinner_quantity - 1)
    dinner_remaining = dinner_kcals - dinner.kcals

    snacks_kcals = (@current_user.calories * 0.05) + breakfast_remaining + lunch_remaining + dinner_remaining
    while snacks_kcals >= (snacks_select.kcals * snacks_quantity)
      snacks_quantity +=1
    end
    snacks = Meal.create! mealplan_id: @mealplan.id, recipe_id: snacks_select.id, quantity: (snacks_quantity - 1)

    flash[:notice] = "BOOM!!!"
    redirect_to edit_mealplan_path(id: @mealplan.id)

  end

end
