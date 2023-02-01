require 'rails_helper'

RSpec.describe 'Post Index Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Doraemon & Nobita', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Best friends')
    @post = Post.create(title: 'Physics', text: 'This is not my first post', author: @user)
    @comment = Comment.create(text: 'First comment', author_id: @user.id, post_id: @post.id)
  end

  describe 'Post show page' do
    before(:each) { visit "/users/#{@user.id}/posts" }

    it "shows the user's profile picture" do
      expect(page).to have_css("img[src='#{@user.photo}']")
    end

    it "shows the user's username" do
      expect(page).to have_content(@user.name)
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end

    it "shows a post's title" do
      within('h2') do
        expect(page).to have_content(@user.posts.first.title)
      end
    end

    it 'shows some of the posts body' do
      expect(page).to have_content(@post.text)
    end

    it 'displays the first comments on a post' do
      expect(page).to have_content('First comment')
    end

    it 'shows how many comments a post has.' do
      expect(page).to have_content("Comments: #{@post.comments_counter}")
    end

    it 'shows how many likes a post has.' do
      expect(page).to have_content("Likes: #{@post.likes_counter}")
    end

    it 'shows a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_content('Pagination')
    end

    it 'when user clicks on a post, it redirects to that posts show page' do
      click_link(@post.title)
      expect(page).to have_current_path user_post_path(@post.author_id, @post)
    end
  end
end
