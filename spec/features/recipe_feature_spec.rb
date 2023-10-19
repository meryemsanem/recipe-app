require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
  let(:user) { User.create!(name: 'Sample User', email: 'emaill@email.com', password: 'password') }

  context 'index' do
    before do
      Recipe.create!(name: 'Recipe 1', description: 'Description 1', preparation_time: 0.5, cooking_time: 1, user:)
      user.confirm

      visit new_user_session_path
      fill_in 'Email', with: 'emaill@email.com'
      fill_in 'Password', with: 'password'
      click_on 'Log in'
    end

    it 'renders a list of recipes' do
      visit recipes_path
      expect(page).to have_content('Recipe 1')
      expect(page).to have_content('Description 1')
    end
  end

  context 'new' do
    before do
      user.confirm

      visit new_user_session_path
      fill_in 'Email', with: 'emaill@email.com'
      fill_in 'Password', with: 'password'
      click_on 'Log in'
    end

    it 'renders the form' do
      visit new_recipe_path
      expect(page).to have_selector('form[action="/recipes"][method="post"]')
      expect(page).to have_field('recipe[name]')
      expect(page).to have_field('recipe[preparation_time]')
      expect(page).to have_field('recipe[cooking_time]')
      expect(page).to have_field('recipe[description]')
    end
  end

  context 'show' do
    let(:recipe) do
      Recipe.create!(name: 'Recipe 1', description: 'Description 1', preparation_time: 0.5, cooking_time: 1, user:)
    end

    before do
      user.confirm

      visit new_user_session_path
      fill_in 'Email', with: 'emaill@email.com'
      fill_in 'Password', with: 'password'
      click_on 'Log in'
    end

    it 'displays the recipe details' do
      visit recipe_path(recipe)
      expect(page).to have_content('Recipe 1')
      expect(page).to have_content('Preparation time')
      expect(page).to have_content('Cooking time')
      expect(page).to have_link('Generate Shopping List')
      expect(page).to have_link('Add Ingredient')
    end
  end
end
