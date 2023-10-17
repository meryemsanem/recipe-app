class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: [:destroy, :edit, :update]

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.all
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)

    if @recipe.user == current_user && @recipe_food.save
      redirect_to @recipe, notice: 'Ingredient successfully added'
    else
      @foods = Food.all
    end
  end


  def update
    if @recipe.user == current_user && @recipe_food.update(recipe_food_params)
      redirect_to @recipe, notice: 'Ingredient updated successfully'
    else
      @foods = Food.all
    end
  end

  def destroy
    @recipe_food.destroy
    redirect_to @recipe, notice: 'Ingredient deleted successfully'
  end

  private

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = @recipe_food.recipe
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
