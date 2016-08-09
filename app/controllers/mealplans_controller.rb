class MealplansController < ApplicationController

  before_action do
    if @current_user.nil?
      redirect_to sign_in_path, alert: "Please sign in if you want to make a Mealplan"
    elsif @current_user.age == nil
      redirect_to edit_profile_path, alert: "We're gonna need this info if you want a Mealplan!"
    elsif @current_user.protein == nil
      redirect_to edit_macros_path, alert: "We need to get Macros first if you want a Mealplan!"
    end
  end

  def list
    @mealplans = @current_user.mealplans
    @collection_names = Recipe.pluck(:collection).uniq
  end

  def new
    puts "============="
    puts params[:name]
    puts "============="



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
