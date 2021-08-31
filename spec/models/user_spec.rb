require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  describe 'Successfully' do
    it 'saved' do
      user = User.new email: 'test1@test.com', password: '123456'
      expect(user.save).to be_truthy
    end
  end
  describe 'Invalid' do
    it 'email' do
      @user = User.create email: 'tes', password: '123456'
      expect(@user.save).to be_falsey
    end
    it 'password' do
      @user = User.create email: 'test@test.com', password: '1234'
      expect(@user.save).to be_falsey
    end
  end
end
