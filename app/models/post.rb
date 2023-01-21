class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def last_five_comments
    comments.last(5)
  end

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
