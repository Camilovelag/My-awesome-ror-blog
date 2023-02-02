class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.post_id = params[:post_id]
    @comment.author_id = current_user.id
    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'Comment created succesfully'
          redirect_to user_post_path(current_user, @comment.post_id)
        else
          flash[:error] = 'Error: Not able to create post'
          render :new, locals: { comment: @comment }
        end
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    @comment.destroy
    @post.comments_counter -= 1
    @post.save
    redirect_to user_post_url(@post.author, @post), notice: 'Comment was successfully deleted!'
  end
end
