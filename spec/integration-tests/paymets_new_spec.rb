require 'rails_helper'

RSpec.describe PaymentsController, type: :feature do
  describe 'Testing payment new view' do
    before(:each) do
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'user_email', with: 'r@gmail.com'
        fill_in 'user_password', with: '1234567'
      end
      click_button 'Next'
    end

    it 'checks if can see the input for name of the payment' do
      visit '/payments/1/new'
      expect(page).to have_selector('.email-field', count: 1)
    end

    it 'checks if can add an amount' do
      visit '/payments/1/new'
      expect(page).to have_selector('.password-field')
    end

    it 'checks when try to create payment without a value must display error' do
      visit '/payments/1/new'
      fill_in 'payment_name', with: ''
      fill_in 'payment_amount', with: '5'
      click_on('Create Payment')
      expect(page).to have_content('The payment was not saved for incorrect data')
    end
  end
end