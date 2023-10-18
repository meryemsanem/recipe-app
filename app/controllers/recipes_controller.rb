class RecipesController < ApplicationController
  before_action :set_user

  def index
    @recipes = @user.recipes.includes(:user) if user_signed_in?
  end

  def show
    @recipe = Recipe.includes(recipe_foods: :food).find(params[:id])
  end

  def new
    @recipe = @user.recipes.build
  end

  def create
    @recipe = @user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def destroy
    @recipe = @user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe deleted successfully.'
  end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    @recipe.public = !@recipe.public
    @recipe.save
    redirect_to recipe_path(@recipe), notice: "The recipe is now #{@recipe.public ? 'public' : 'private'}"
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :public, :description)
  end

  def set_user
    @user = current_user
  end
end
