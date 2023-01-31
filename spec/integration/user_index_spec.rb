require 'rails_helper'

RSpec.describe 'User Index', type: :system do
  describe ' user index page' do
    before(:each) do
      @user = User.create(
        name: 'Kanza Tehreen',
        bio: 'Full Stack Web Developer',
        photo: 'https://avatars.kanzatehreen.com',
      )
      @post = Post.create(title: 'First Post', text: 'This is my first post', author_id: @user.id)
      @comment = Comment.create(text: 'First comment', author_id: @user.id, post_id: @post.id)
      Like.create(author_id: @user.id, post_id: @post.id)

      visit users_path
    end

    it 'should display all users' do
      expect(page).to have_content('Kanza Tehreen')
    end

    it 'shows the right photo' do
      expect(page).to have_css("img[src*='https://avatars.kanzatehreen.com']")
    end

    it 'displays the right Number of posts' do
      expect(page).to have_content('Number of posts: 1')
    end

    it 'redirected to show path' do
      click_link 'Kanza Tehreen'
      expect(page).to have_content('Full Stack Web Developer')
    end
  end
end
