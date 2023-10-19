require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'validations' do
    it 'is not valid without food id' do
      recipe_food = RecipeFood.new
      recipe_food.food_id = nil
      expect(recipe_food).to_not be_valid
    end
    it 'is not valid without recipe id' do
      recipe_food = RecipeFood.new
      recipe_food.recipe_id = nil
      expect(recipe_food).to_not be_valid
    end
  end
end
