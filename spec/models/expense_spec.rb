require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(name: 'Ben', email: 'ben@gmail.com', password: '123456') }

  let(:expense) { Expense.new(author: user, name: 'Pizza', amount: 10) }

  context 'Expense validation' do
    it 'is valid with author, name and amount' do
      expect(expense).to be_valid
    end

    it 'is not valid without an amount' do
      expense.amount = nil
      expect(expense).to_not be_valid
    end

    it 'is not valid if amount is not a number' do
      expense.amount = 'a'
      expect(expense).to_not be_valid
    end

    it 'is not valid without if amount is less than 0' do
      expense.amount = -1
      expect(expense).to_not be_valid
    end

    it 'is not valid without a name' do
      expense.name = nil
      expect(expense).to_not be_valid
    end
  end
end
