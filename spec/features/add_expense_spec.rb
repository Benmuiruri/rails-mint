require 'rails_helper'
require 'helpers/model_helper'

RSpec.feature 'Login Page' do
  feature 'shows login' do
    background do
      visit new_user_session_path
      @user1 = User.create(name: 'Ben', email: 'ben@gmail.com', password: '123456')
      within 'form' do
        fill_in 'Email', with: @user1.email
        fill_in 'Password', with: @user1.password
      end
      click_button 'Log in'
      @groups = create_groups_for_user(@user1).first
      @expenses = create_expenses_for_user(@user1).first
    end

    scenario 'shows welcome greeting if user has no groups' do
      expect(page).to have_content('Welcome to the Rails Mint')
    end

    scenario 'Add a category' do
      visit new_group_path
      fill_in 'Name', with: 'Bills'
      fill_in 'Icon', with: 'https://image.com'
      click_button 'Add Category'

      expect(page).to have_content('You have tracked $10.0 across 2 categories')
    end

    scenario 'Add a expense in the Bills category' do
      visit group_path(Group.last)
      click_link 'Add a new Expense'
      fill_in 'Name', with: 'Rent'
      fill_in 'Amount', with: 220
      select('Group 0', from: 'expense[group_id]')
      click_button 'Add Expense'
      expect(page).to have_content('You have tracked $220.0 of Group 0')
      expect(page).to have_current_path(group_path(Group.last))
    end
  end
end
