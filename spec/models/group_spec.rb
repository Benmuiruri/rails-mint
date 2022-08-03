require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'Ben', email: 'ben@gmail.com', password: '123456') }

  let(:group) { Group.create(user: user, name: 'Bills', icon: 'https://image.com') }

  context 'Group validation' do
    it 'is valid with a user, name, and icon' do
      expect(group).to be_valid
    end

    it 'is not valid without a name' do
      group.name = nil
      expect(group).to_not be_valid
    end

    it 'is not valid without an icon' do
      group.icon = nil
      expect(group).to_not be_valid
    end
  end
end