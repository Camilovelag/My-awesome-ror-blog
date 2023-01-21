require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
  end

  it 'should create a comment' do
    comment = Comment.create(post: @post, author: @user, text: 'Hi Tom!')
    expect(comment).to be_valid
  end

  it 'should not create a comment without an author' do
    comment = Comment.create(post: @post, text: 'test')
    expect(comment).to_not be_valid
  end
end
