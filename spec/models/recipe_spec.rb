require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  before(:each) do
    User.create email: 'test@test.com', password: '123456'
    Category.create name: 'Category', priority: 1
  end

  describe 'for valid' do
    it 'Recipe' do
      file = Rails.root.join('spec', 'image', 'test.png')
      image = ActiveStorage::Blob.create_and_upload!(
        io: File.open(file, 'rb'),
        filename: 'test.png',
        content_type: 'image/png' # Or figure it out from `name` if you have non-JPEGs
      ).signed_id

      recipe = Recipe.new title: 'Test my Recipe', content: 'Test Content must be really long for this or will fail',
                          category_id: 1, user_id: 1, image: image
      expect(recipe.save).to be_truthy
    end
  end
  describe 'for invalid' do
    it 'Title' do
      recipe = Recipe.create content: 'Test Content must be really long for this or will fail', category_id: 1,
                             user_id: 1
      expect(recipe.save).to be_falsey
    end
    it 'Content' do
      recipe = Recipe.create title: 'Test my Recipe', category_id: 1, user_id: 1
      expect(recipe.save).to be_falsey
    end
  end
end
