require 'rails_helper'

RSpec.describe Recipe, type: :model do

  before :context do
    @user = User.create email: 'test@test.com', password: '123456'
    @user.save
    @category = Category.create name: 'Category', priority: 1
    @category.save
    @recipe = Recipe.create title: 'Test', content: 'Test Content', category_id: 1, user_id: 1
    @recipe.save
  end

  describe 'for valid' do
    it 'Recipe' do
      file = Rails.root.join('spec', 'image', 'test.png')
      image = ActiveStorage::Blob.create_and_upload!(
        io: File.open(file, 'rb'),
        filename: 'test.png',
        content_type: 'image/png' # Or figure it out from `name` if you have non-JPEGs
      ).signed_id
      recipe = Recipe.create title: 'Test', content: 'Test Content', category_id: 1, user_id: 1, image: image
      expect(recipe.save).to be_truthy
    end
  end
  describe 'for invalid' do
    it 'Title' do
      recipe = Recipe.create content: 'Test Content', category_id: 1, user_id: 1
      expect(recipe.save).to be_falsey
    end
    it 'Content' do
      recipe = Recipe.create title: 'Test', category_id: 1, user_id: 1
      expect(recipe.save).to be_falsey
    end
  end
end