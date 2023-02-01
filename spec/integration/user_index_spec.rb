require 'rails_helper'

RSpec.describe 'User Index', type: :system do
  describe ' user index page' do
    before(:each) do
      @user = User.create(
        name: 'Kanza Tehreen',
        bio: 'Full Stack Web Developer',
        photo: 'https://avatars.kanzatehreen.com'
      )
      @post = Post.create(title: 'First Post', text: 'This is my first post', author_id: @user.id)

      visit users_path
    end

    it 'shows the username of all other users' do
      expect(page).to have_content('Kanza Tehreen')
    end

    it 'shows the profile picture for each user' do
      expect(page).to have_css("img[src*='https://avatars.kanzatehreen.com']")
    end

    it 'shows the number of posts each user has written' do
      expect(page).to have_content('Number of posts: 1')
    end

    it 'When a user clicks on an user, it redirects to that users show page' do
      click_link 'Kanza Tehreen'
      expect(page).to have_content('Full Stack Web Developer')
    end
  end
end
