require 'rails_helper'

RSpec.describe 'Foods', type: :feature do
  let(:user) { User.create!(name: 'Sample User', email: 'mshack@email.com', password: 'password') }

  context 'index' do
    before do
      Food.create!(name: 'Food 1',
                   price: 10,
                   measurement_unit: 'grams',
                   quantity: 2,
                   user:)
      user.confirm

      visit new_user_session_path
      fill_in 'Email', with: 'mshack@email.com'
      fill_in 'Password', with: 'password'
      click_on 'Log in'
    end

    it 'renders a list of foods' do
      visit foods_path
      expect(page).to have_content('Food 1')
    end
    it 'renders a list of foods' do
      visit foods_path
      expect(page).to have_content(10)
    end
  end

  context 'new' do
    before do
      user.confirm

      visit new_user_session_path
      fill_in 'Email', with: 'mshack@email.com'
      fill_in 'Password', with: 'password'
      click_on 'Log in'
    end

    it 'renders the form' do
      visit new_food_path
      expect(page).to have_selector('form[action="/foods"][method="post"]')
      expect(page).to have_field('food[name]')
      expect(page).to have_field('food[price]')
    end
    it 'renders the form' do
      visit new_food_path
      expect(page).to have_selector('form[action="/foods"][method="post"]')
      expect(page).to have_field('food[measurement_unit]')
      expect(page).to have_field('food[quantity]')
    end
  end
end
