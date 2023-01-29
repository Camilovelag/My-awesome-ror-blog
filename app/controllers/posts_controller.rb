class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author_id = current_user.id
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post created successfully'
          redirect_to user_posts_path(current_user)
        else
          flash[:error] = 'Error: Not able to create post'
          render :new, locals: { post: @post }
        end
      end
    end
  end

  def like
    @post = Post.find(params[:post_id])
    @user = Post.find(params[:user_id])
    Like.create(author_id: @user.id, post_id: @post.id)
    redirect_to user_post_path(@user, @post)
  end
end
