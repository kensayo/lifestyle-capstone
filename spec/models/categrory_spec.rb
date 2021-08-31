require 'rails_helper'

RSpec.describe Vote, type: :model do
  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  describe 'on Creation' do
    it 'valid' do
      cat = Category.new name: 'Test', priority: 1
      expect(cat.save).to be_truthy
    end

    it 'invalid name' do
      cat = Category.new name: 'T', priority: 1
      expect(cat.save).to be_falsey
    end

    it 'invalid priority' do
      cat = Category.new name: 'Test'
      expect(cat.save).to be_falsey
    end
  end
end
