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

    it 'checks if can see the all user categories' do
      visit '/categories/'
      expect(page).to have_selector('.category-container', count: 1)
    end

    it 'checks if can add a new categorie' do
      visit '/categories/'
      expect(page).to have_content('Add category')
    end

    it 'checks if can see delete button as categorie owner' do
      visit '/categories/'
      expect(page).to have_selector('.button_to')
    end

    it 'checks when click on category redirects to show payments' do
      visit '/categories/'
      click_on('Test')
      expect(page).to have_current_path('/payments/1')
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
