require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with a name' do
       user = User.new(name: "Sample User", email: "email@email.com", password: "password")
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new
      expect(user).not_to be_valid
    end
  end
end
