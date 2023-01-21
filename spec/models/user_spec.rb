require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should create a user' do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    expect(user).to be_valid
  end

  it 'should not create a user without a name' do
    user = User.create(photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    expect(user).to_not be_valid
  end

  it 'post_counter should be greater than or equal to zero' do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    Post.create(author: user, title: 'Hello', text: 'This is my first post')
    expect(user.posts_counter).to be >= 0
  end
end
