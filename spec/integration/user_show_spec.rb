require 'rails_helper'

RSpec.describe 'User show page', type: :system do
  describe 'User show page' do
    before(:each) do
      @user = User.create(
        name: 'Kanza Tehreen',
        bio: 'Full Stack Web Developer',
        photo: 'https://avatars.kanzatehreen.com'
      )
      @post = Post.create(title: 'First Post', text: 'This is my first post', author_id: @user.id)

      visit user_path(@user)
    end

    it 'shows the users profile picture' do
      expect(page).to have_css('img[src*="https://avatars.kanzatehreen.com"]')
    end

    it 'shows the users username' do
      expect(page).to have_content('Kanza')
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 1')
    end

    it 'shows the users bio' do
      expect(page).to have_content('Full Stack Web Developer')
    end

    it 'shows the users first 3 posts' do
      @user.last_three_posts.each do |post|
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.text)
      end
    end

    it 'shows a button that lets me view all of a users posts' do
      expect(page).to have_button('See all posts')
    end

    it 'when a user click a users post, it redirects me to that posts show page.' do
      click_link 'First Post'
      expect(page).to have_current_path user_post_path(@user, @post)
    end

    it 'when a user click to see all posts, it redirects me to the users posts index page' do
      click_button 'See all posts'
      expect(page).to have_current_path user_posts_path(@user)
    end
  end
end
