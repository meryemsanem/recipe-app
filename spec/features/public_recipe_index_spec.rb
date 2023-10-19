require 'rails_helper'

RSpec.describe 'Public Recipes', type: :feature do
  let(:user) { User.create!(name: 'Sample User', email: 'gname@email.com', password: 'password') }

  context 'index' do
    before do
      Recipe.create!(name: 'Recipe 1', description: 'Description 1', preparation_time: 0.5, public: true,
                     cooking_time: 1, user:)
      user.confirm

      visit new_user_session_path
      fill_in 'Email', with: 'gname@email.com'
      fill_in 'Password', with: 'password'
      click_on 'Log in'
    end

    it 'renders a list of recipes' do
      visit public_recipes_path
      expect(page).to have_content('Sample User')
    end
    it 'renders a list of recipes' do
      visit public_recipes_path
      expect(page).to have_content('Recipe 1')
    end
  end
end
