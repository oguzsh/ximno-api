require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create({ email: 'user@example.com', first_name: 'Example', last_name: 'User', password: '12345678',
                          password_confirmation: '12345678' })
    @other_user = User.create({ email: 'other@example.com', first_name: 'Other', last_name: 'User', password: '12345678', password_confirmation: '12345678' })
  end

  it 'should be valid' do
    @user.valid?
  end

  describe '#follow' do
    it 'should not have following user' do
      expect(@user.following?(@other_user)).to eq false
    end

    it 'should follow a user' do
      @user.follow(@other_user)
      expect(@user.following?(@other_user)).to eq true
    end
  end

  describe '#unfollow' do
    before do
      @user.follow(@other_user)
    end

    it 'should have following user' do
      expect(@user.following?(@other_user)).to eq true
    end

    it 'should unfollow a user' do
      @user.unfollow(@other_user)
      expect(@user.following?(@other_user)).to eq false
    end
  end
end
