require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'Category', type: :feature do
  before(:each) do
    visit new_user_registration_url
    within('form') do
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      fill_in 'user[email]', with: 'email@test.com'
    end
    click_button('Sign Up')
    visit new_category_path
  end

  context 'when New' do
    it 'Successful' do
      within('form') do
        fill_in 'category[name]', with: 'Test'
        fill_in 'category[priority]', with: '1'
      end
      click_button('Create')
      expect(page).to have_content('Test')
    end
    it 'invalid name' do
      within('form') do
        fill_in 'category[name]', with: 'T'
        fill_in 'category[priority]', with: '1'
      end
      click_button('Create')
      expect(page).to have_content('Name is too short')
    end
    it 'invalid priority' do
      within('form') do
        fill_in 'category[name]', with: 'Test'
      end
      click_button('Create')
      expect(page).to have_content("Priority can't be blank")
    end
  end
end
# rubocop:enable Metrics/BlockLength
