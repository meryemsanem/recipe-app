require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Validations' do
    it 'is valid with a name, preparation_time, cooking_time, and description' do
      user = User.new(name: 'Sample User', email: 'email@email.com', password: 'password')
      recipe = user.recipes.build(
        name: 'Sample Recipe',
        preparation_time: 0.5,
        cooking_time: 1,
        description: 'Description of Sample Recipe.'
      )
      expect(recipe).to be_valid
    end

    it 'is not valid without a name' do
      recipe = Recipe.new(
        preparation_time: 0.5,
        cooking_time: 1,
        description: 'Description of Sample Recipe.'
      )
      expect(recipe).not_to be_valid
    end

    it 'is not valid without a preparation_time' do
      recipe = Recipe.new(
        name: 'Sample Recipe',
        cooking_time: 1,
        description: 'Description of Sample Recipe.'
      )
      expect(recipe).not_to be_valid
    end

    it 'is not valid without a cooking_time' do
      recipe = Recipe.new(
        name: 'Sample Recipe',
        preparation_time: 0.5,
        description: 'Description of Sample Recipe.'
      )
      expect(recipe).not_to be_valid
    end

    it 'is not valid without a description' do
      recipe = Recipe.new(
        name: 'Sample Recipe',
        preparation_time: 0.5,
        cooking_time: 1
      )
      expect(recipe).not_to be_valid
    end
  end
  describe 'Associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many recipe_foods' do
      association = described_class.reflect_on_association(:recipe_foods)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many foods through recipe_foods' do
      association = described_class.reflect_on_association(:foods)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:recipe_foods)
    end
  end
end
