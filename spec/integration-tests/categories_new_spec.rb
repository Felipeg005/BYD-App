require 'rails_helper'

RSpec.describe CategoriesController, type: :feature do
  describe 'Testing category index view' do
    before(:each) do
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'user_email', with: 'r@gmail.com'
        fill_in 'user_password', with: '1234567'
      end
      click_button 'Next'
    end

    it 'checks if can see category name input' do
      visit '/categories/new'
      expect(page).to have_selector('.email-field')
    end

    it 'checks if all possible icons are displayed to be choosen' do
      visit '/categories/new'
      expect(page).to have_selector('.icon-container', count: 10)
    end

    it 'checks if the button create new category its displayed' do
      visit '/categories/new'
      expect(page).to have_selector('.create-button')
    end

    it 'checks when try to create category without a value must display error' do
      visit '/categories/new'
      fill_in 'category_name', with: ''
      choose(option: 'icon-party.png')
      click_on('Create Category')
      expect(page).to have_content('The category was not saved for incorrect data')
    end

    describe 'Testing with other user' do
      before(:each) do
        visit '/users/sign_out'
      end
      it 'checks if categories only shows for owner user' do
        visit '/users/sign_in'
        within('#new_user') do
          fill_in 'user_email', with: 'e@gmail.com'
          fill_in 'user_password', with: '1234567'
        end
        click_button 'Next'
        visit '/categories/'
        expect(page).not_to have_content('.category-container')
      end
    end
  end
end
