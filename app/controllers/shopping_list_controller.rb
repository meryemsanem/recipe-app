class ShoppingListController < ApplicationController
  def index
    @recipe = current_user.recipes.find_by(id: params[:recipe_id])

    @recipe_foods = current_user.recipe_foods.group(:food_id).sum(:quantity)
    @foods = current_user.foods
  end
end
