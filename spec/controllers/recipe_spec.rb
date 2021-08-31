require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'Recipe', type: :feature do
  before(:each) do
    visit new_user_registration_url
    within('form') do
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      fill_in 'user[email]', with: 'email@test.com'
    end
    click_button('Sign Up')
    visit new_category_path
    within('form') do
      fill_in 'category[name]', with: 'Test'
      fill_in 'category[priority]', with: '1'
    end
    click_button('Create')
    visit new_recipe_path
  end

  context 'when New' do
    it 'invalid title' do
      within('form') do
        fill_in 'recipe[title]', with: 'Tittle'
        fill_in 'recipe[content]', with: '1'
      end
      click_button('Publish Recipe')
      expect(page).to have_content('Title is too short')
    end
    it 'invalid content' do
      within('form') do
        fill_in 'recipe[title]', with: 'Tittle must be this long'
        fill_in 'recipe[content]', with: 'This is too short'
      end
      click_button('Publish Recipe')
      expect(page).to have_content('Content is too short')
    end
  end
end
# rubocop:enable Metrics/BlockLength
