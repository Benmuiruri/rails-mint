require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Ben', email: 'ben@gmail.com', password: '123456') }

  context '.name' do
    it 'is not valid with a name less than 3 characters' do
      user.name = 'M'
      expect(user).to_not be_valid
    end

    it 'is valid with a name of more than 3 characters' do
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user.email = nil
      expect(user).to_not be_valid
    end
  end
end
