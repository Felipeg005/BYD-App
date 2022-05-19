require 'rails_helper'

RSpec.describe PaymentsController, type: :feature do
  describe 'Testing payment index view' do
    before(:each) do
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'user_email', with: 'r@gmail.com'
        fill_in 'user_password', with: '1234567'
      end
      click_button 'Next'
    end

    it 'checks if can see the all user categories' do
      visit '/payments/1'
      expect(page).to have_selector('.category-container', count: 2)
    end

    it 'checks if can add a new payment' do
      visit '/payments/1'
      expect(page).to have_content('Add payment')
    end

    it 'checks if can see delete button' do
      visit '/payments/1'
      expect(page).to have_selector('.button_to')
    end

    it 'checks if can see the total for all payments in category' do
      visit '/payments/1'
      expect(page).to have_content('Total spent in Test Category $90.0')
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
        visit '/payments/2'
        expect(page).not_to have_content('.Test Payment 1')
      end
    end
  end
end
