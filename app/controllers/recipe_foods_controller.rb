class RecipeFoodsController < ApplicationController
  before_action :find_recipe
  before_action :find_recipe_food, only: %i[edit update destroy]

  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def create
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)
    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Ingredient successfully added.'
    else
      @foods = Food.all
      render :new
    end
  end

  def edit
    @foods = Food.all
  end

  def update
    if @recipe_food.update(recipe_food_params)
      redirect_to recipe_path(@recipe), notice: 'Ingredient updated successfully.'
    else
      @foods = Food.all
      render :edit
    end
  end

  def destroy
    @recipe_food.destroy
    redirect_to recipe_path(@recipe), notice: 'Ingredient deleted successfully.'
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def find_recipe_food
    @recipe_food = @recipe.recipe_foods.find(params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
