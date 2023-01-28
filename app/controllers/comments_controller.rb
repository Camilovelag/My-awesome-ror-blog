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
          redirect_to user_post_path(current_user.id, @comment.post_id)
        else
          flash[:error] = 'Error: Not able to create post'
          render :new, locals: { comment: @comment }
        end
      end
    end
  end
end
