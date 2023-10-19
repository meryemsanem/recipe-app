require 'rails_helper'

RSpec.describe 'Recipe Foods', type: :feature do
  let(:user) { User.create!(name: 'Sample User', email: 'emaill@email.com', password: 'password') }

  context 'edit' do
    let(:food) { Food.create!(name: 'Food Item 1', price: 5.0, measurement_unit: 'unit', quantity: 1, user:) }
    let(:recipe) do
      Recipe.create!(
        name: 'Recipe 1',
        description: 'Description 1',
        preparation_time: 0.5,
        cooking_time: 1,
        user:
      )
    end

    let(:recipe_food) { RecipeFood.create!(recipe:, food:, quantity: 2) }

    it 'edits a recipe food item' do
      visit edit_recipe_recipe_food_path(recipe, recipe_food)

      fill_in 'Quantity', with: 3

      click_on 'Update Recipe Food'

      expect(page).to have_content('Ingredient updated successfully.')
    end
  end

  context 'new' do
    let(:recipe) do
      Recipe.create!(
        name: 'Recipe 1',
        description: 'Description 1',
        preparation_time: 0.5,
        cooking_time: 1,
        user:
      )
    end
  end
end
