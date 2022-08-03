def create_and_activate_user(name)
  user = User.create!(name:, email: 'ben@gmail.com', password: 'password')
  user.save!
  user
end

def create_groups_for_user(user, count: 1)
  groups = []
  count.times do |i|
    groups << Group.create!(
      user:,
      name: "Group #{i}",
      icon: 'https://image.com'
    )
  end
  groups
end

def create_expenses_for_user(user, count: 1)
  expenses = []
  count.times do |i|
    expenses << Expense.create!(
      author: user,
      name: "Expense #{i}",
      amount: 10
    )
  end
  expenses
end
