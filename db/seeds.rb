# Sample Data

User.create!(
  name: 'Ben',
  email: 'ben@gmail.com',
  password: '123456'
)

User.create!(
  name: 'Mon',
  email: 'mon@gmail.com',
  password: '123456'
)

User.create!(
  name: 'Jack',
  email: 'jack@gmail.com',
  password: '123456'
)

Group.create!(
  user: User.first,
  name: 'Bills',
  icon: 'https://res.cloudinary.com/optprime/image/upload/v1659435132/stash-it/Bills_bm7uaf.png'
)

Group.create!(
  user: User.first,
  name: 'Food',
  icon: 'https://res.cloudinary.com/optprime/image/upload/v1659435132/stash-it/food_sjw1yb.png'
)

Group.create!(
  user: User.first,
  name: 'Saving',
  icon: 'https://res.cloudinary.com/optprime/image/upload/v1659435132/stash-it/saving_c7mrn6.png'
)

Group.create!(
  user: User.second,
  name: 'Food',
  icon: 'https://res.cloudinary.com/optprime/image/upload/v1659435132/stash-it/food_sjw1yb.png'
)

Group.create!(
  user: User.second,
  name: 'Travel',
  icon: 'https://res.cloudinary.com/optprime/image/upload/v1659435132/stash-it/travel_o9wx2x.png'
)

Expense.create!(
  author: User.first,
  groups: [Group.first],
  name: 'Rent',
  amount: 220
)

Expense.create!(
  author: User.first,
  groups: [Group.third],
  name: '52 Week Challenge',
  amount: 50
)

Expense.create!(
  author: User.first,
  groups: [Group.second],
  name: 'Birthday cale',
  amount: 35
)

Expense.create!(
  author: User.second,
  groups: [Group.second],
  name: 'Pizza',
  amount: 15
)

Expense.create!(
  author: User.second,
  groups: [Group.last],
  name: 'Dubai vacation',
  amount: 1300
)

p "Added #{User.count} users to the database"
p "Added #{Group.count} categories to the database"
p "Added #{Expense.count} expenses to the database"