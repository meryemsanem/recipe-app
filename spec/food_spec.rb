require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.create(name: 'Dan', email: 'test@example.com', password: 'password', confirmed_at: Time.now) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      food = Food.new(
        id: 1,
        measurement_unit: 'grams',
        quantity: 100,
        price: 10.99,
        user:
      )
      expect(food).to_not be_valid
    end

    it 'should have valid attributes' do
      food = Food.new(
        id: 1,
        name: 'Pizza',
        measurement_unit: 'grams',
        quantity: 100,
        price: 10.99,
        user:
      )
      expect(food).to be_valid
    end

    it 'should have valid attributes' do
      food = Food.new(
        id: 1,
        name: 'Pizza',
        measurement_unit: 'grams',
        quantity: 100,
        user:
      )
      expect(food).to_not be_valid
    end

    it 'should have valid attributes' do
      food = Food.new
      food.quantity = nil
      expect(food).to_not be_valid
    end
  end
end
