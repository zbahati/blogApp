class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_parms)
    @comment.user = @user

    if @comment.save
      redirect_to user_post_path(@user, @post, @comment)
    else
      render 'new'
    end
  end

  private

  def comment_parms
    params.require(:comment).permit(:Text)
  end
end
