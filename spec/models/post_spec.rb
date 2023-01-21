require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  it 'should create a post' do
    post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
    expect(post).to be_valid
  end

  it 'should not create a post without a title' do
    post = Post.create(author: @user, text: 'This is my first post')
    expect(post).to_not be_valid
  end

  it 'title should not exceed 250 characters' do
    long_title = 'a' * 251
    post = Post.create(author: @user, title: long_title, text: 'This is my first post')
    expect(post).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to zero' do
    post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
    Comment.create(post: post, author: @user, text: 'Hi Tom!')
    expect(post.comments_counter).to be >= 0
  end
end
