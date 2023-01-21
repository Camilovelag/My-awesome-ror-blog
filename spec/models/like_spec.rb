require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
  end

  it 'should create a like' do
    like = Like.create(author: @user, post: @post)
    expect(like).to be_valid
  end
end
