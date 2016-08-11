class MealplansController < ApplicationController

  before_action :authenticate_user!

  before_action do
    if @current_user.age == nil
      redirect_to edit_profile_path, alert: "We're gonna need this info if you want a Mealplan!"
    elsif @current_user.protein == nil
      redirect_to edit_macros_path, alert: "We need to get Macros first if you want a Mealplan!"
    end
  end

  def list
    @mealplans = @current_user.mealplans
    @recipes = Recipe.where.not("category ~* ?", "^[0-9]")
    @collection_names = @recipes.pluck(:collection).uniq

  end

  def new
    if params[:name] == ""
      mealplan_number = @current_user.mealplans.size + 1
      @mealplan = Mealplan.new
      @mealplan.user_id = @current_user.id
      @mealplan.name = "Day #{mealplan_number}"
    else
      @mealplan = Mealplan.new
      @mealplan.user_id = @current_user.id
      @mealplan.name = params[:name]
    end
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

    @remaining_calories = @current_user.calories - @mealplan.kcals
    @remaining_protein = @current_user.protein - @mealplan.proteins
    @remaining_carbs = @current_user.carbs - @mealplan.carbs
    @remaining_fat = @current_user.fat - @mealplan.fats

    @collection_recipes = Recipe.where.not("category ~* ?", "^[0-9]")
    @user_favorites = Recipe.where(category: (@current_user.id).to_s)

    @recipes = @collection_recipes.or(@user_favorites)

  end

  def delete_mealplan
    @mealplan = Mealplan.find_by id: params[:id]
    @mealplan.destroy
    redirect_to mealplans_path, notice: "Mealplan Deleted"
  end

  def add_meal
    @recipes = Recipe.all
    # @recipes = Recipe.where.not("category ~* ?", "^[0-9]")
    # current_user_recipe Recipe.where(category: @current_user.id.to_s)
    # shovel operation 2 into array number 1
    @mealplan = Mealplan.find_by id: params[:id]
    @new_meal = Meal.new
    @new_meal.mealplan_id = @mealplan.id
    @new_meal.recipe_id = params[:mealplan][:meals]
    @new_meal.quantity = params[:mealplan][:quantity]

    unless params[:mealplan][:meals].present?
      redirect_to edit_mealplan_path(id: @mealplan.id), notice: "You have to select a meal to add"
    else
      @remaining_calories = @current_user.calories - @mealplan.kcals - @new_meal.kcals

      if @remaining_calories < 0
        redirect_to edit_mealplan_path(id: @mealplan.id), notice: "That's too many calories, remove something first before adding this meal"
      elsif @new_meal.save && @remaining_calories > 0
        redirect_to edit_mealplan_path, notice: "Meal Added"
      else
        flash[:notice] = "Oops! Something went wrong... Try again?"
        render :edit
      end
    end
  end

  def delete_meal
    @meal = Meal.find_by id: params[:meal_id]
    @meal.destroy
    redirect_to edit_mealplan_path(params[:id]), notice: "Meal Deleted"
  end

  def generate
    @mealplan = Mealplan.find_by id: params[:id]
    auto_mealplans = MealplanParser.new(@current_user.id)
    auto_mealplans.generate!(@mealplan.id)
    redirect_to mealplan_path(id:@mealplan.id), notice: "Mealplan Created!"
  end

  def auto_mealplans
    if params[:collection] == ""
      redirect_to mealplans_path, notice: "You have to select a Recipe Collection"
    else
      auto_mealplans = MealplanParser.new(@current_user.id)
      auto_mealplans.generate_collection!(params[:collection])
      redirect_to mealplans_path, notice: "Mealplans Created!"
    end
  end

end
