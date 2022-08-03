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

    scenario 'shows welcome greeting' do
      expect(page).to have_content('Welcome to the Rails Mint')
    end

    scenario 'shows sign out link after user login' do
      expect(page).to have_content('Log Out')
    end
  end
end
