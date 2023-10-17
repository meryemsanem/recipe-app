class ShoppingListController < ApplicationController
  def index
    @recipe = current_user.recipes.find_by(id: params[:recipe_id])

    if @recipe.nil?
      flash[:alert] = "Recipe not found"
      redirect_to foods_path  
      return
    end

    @recipe_foods = @recipe.recipe_foods.group(:food_id).sum(:quantity)
    @foods = current_user.foods
  end
end
