require 'rails_helper'

RSpec.describe Vote, type: :model do

  before :context do
    @user = User.create email: 'test@test.com', password: '123456'
    @user.save
    @category = Category.create name: 'Category', priority: 1
    @category.save
    @recipe = Recipe.create title: 'Test', content: 'Test Content', category_id: 1, user_id: 1
    @recipe.save
  end

  describe 'for valid' do
    it 'User & Category' do
      vote = Vote.create recipe_id: 1, user_id: 1
      vote.save
      expect(vote).to be_valid
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