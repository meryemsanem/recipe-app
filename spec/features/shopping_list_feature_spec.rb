require 'rails_helper'

RSpec.describe 'shopping_list/index', type: :view do
  context 'when the user has a shopping list' do
    before do
      @user = create(:user)
      @recipe = create(:recipe, user: @user)
      @food = create(:food, name: 'Food Item 1', price: 5.0, quantity: 10, user: @user, measurement_unit: 'unit')
      @recipe_food = create(:recipe_food, recipe: @recipe, food: @food, quantity: 5)

      assign(:recipe, @recipe)
      assign(:recipe_foods, { @food.id => 5 })
      assign(:foods, [@food])

      render
    end

    it 'displays the shopping list information' do
      expect(rendered).to have_content('Shopping List')
      expect(rendered).to have_content('Amount of food items to buy:')
      expect(rendered).to have_content('Total value of food needed:')
    end

    it 'displays the table with food items to buy' do
      expect(rendered).to have_css('table.table-shopping')
      expect(rendered).to have_css('th', text: 'Food')
      expect(rendered).to have_css('th', text: 'Quantity')
      expect(rendered).to have_css('th', text: 'Price')
    end
  end
end
