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
    end

    scenario 'shows welcome greeting if user has no groups' do
      expect(page).to have_content('Welcome to the Rails Mint')
    end

    scenario 'Add a category' do
      visit new_group_path
      fill_in 'Name', with: 'Bills'
      fill_in 'Icon', with: 'https://image.com'
      click_button 'Add Category'

      expect(page).to have_content('You have tracked $0 across 1 categories')
    end
  end
end
