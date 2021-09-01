require 'rails_helper'

RSpec.describe Vote, type: :model do
  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  before(:each) do
    User.create email: 'test@test.com', password: '123456'
    Category.create name: 'Category', priority: 1
  end

  describe 'for Valid' do
    it 'Vote' do
      vote = Vote.new recipe_id: 1, user_id: 10
      expect(vote).to be_invalid
    end
  end

  describe 'for invalid' do
    it 'User' do
      vote = Vote.create recipe_id: 1, user_id: 10
      vote.save
      expect(vote).to be_invalid
    end
    it 'Category' do
      vote = Vote.create recipe_id: 10, user_id: 10
      vote.save
      expect(vote).to be_invalid
    end
  end
end
