require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.feature 'User', type: :feature do
  describe 'Successful' do
    before(:each) do
      visit new_user_registration_url
      within('form') do
        fill_in 'user[password]', with: '123456'
        fill_in 'user[password_confirmation]', with: '123456'
        fill_in 'user[email]', with: 'email@test.com'
      end
      click_button('Sign Up')
    end

    context 'After Sign Up' do
      it 'completed' do
        visit root_path
        expect(page).to have_content('email@test.com')
      end
    end
  end

  describe 'Unsuccessful' do
    context 'After Sign Up' do
      it 'Password too short' do
        visit new_user_registration_url
        within('form') do
          fill_in 'user[password]', with: '1234'
          fill_in 'user[password_confirmation]', with: '1234'
          fill_in 'user[email]', with: 'email@test.com'
        end
        click_button('Sign Up')
        expect(page).to have_content('Password is too short')
      end
      it 'Invalid Email' do
        visit new_user_registration_url
        within('form') do
          fill_in 'user[password]', with: '123456'
          fill_in 'user[password_confirmation]', with: '123456'
          fill_in 'user[email]', with: 'email'
        end
        click_button('Sign Up')
        expect(page).to have_content('Email is invalid')
      end
      it 'Password too short' do
        visit new_user_registration_url
        within('form') do
          fill_in 'user[password]', with: '123456'
          fill_in 'user[password_confirmation]', with: '678912'
          fill_in 'user[email]', with: 'email@test.com'
        end
        click_button('Sign Up')
        expect(page).to have_content("Password confirmation doesn't match")
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
