class LikesController < ApplicationController
  def new
    Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    Like.create(author_id: current_user.id, post_id: @post.id)
    redirect_to user_post_path(current_user, @post)
  end
end
