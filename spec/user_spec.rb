require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with a name' do
      user = User.new(name: 'Sample User', email: 'emaill@email.com', password: 'password')
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new
      expect(user).not_to be_valid
    end
  end

  describe 'Associations' do
    it 'has many foods' do
      association = described_class.reflect_on_association(:foods)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many recipes' do
      association = described_class.reflect_on_association(:recipes)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many recipe_foods through recipes' do
      association = described_class.reflect_on_association(:recipe_foods)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:recipes)
    end
  end
end
