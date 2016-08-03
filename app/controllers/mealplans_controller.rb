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
    @mealplan = Mealplan.new
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
      puts @new_meal.errors.full_messages
      puts params
      flash[:notice] = "Something went wrong"
      render :edit
    end
  end

  def delete_meal
    @meal = Meal.find_by id: params[:meal_id]
    @meal.destroy
    redirect_to edit_mealplan_path(params[:id]), notice: "Meal Deleted"
  end

end
