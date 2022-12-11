require 'rails_helper'

RSpec.describe Follow, type: :model do
  before do
    @follow = Follow.new(follower_id: 1, followed_user_id: 2)
  end

  it 'should be valid' do
    @follow.valid?
  end

  it 'should require a follower_id' do
    @follow.follower_id = nil
    expect(@follow.valid?).to eq false
  end

  it 'should require followed_user_id' do
    @follow.followed_user_id = nil
    expect(@follow.valid?).to eq false
  end
end
