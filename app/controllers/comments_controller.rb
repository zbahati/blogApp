class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
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

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @post.decrement!(:Comments_counter)
    @comment.destroy!
    redirect_to user_post_comment_path(current_user, @post, @comment)
  end

  private

  def comment_parms
    params.require(:comment).permit(@user, @post, :Text)
  end
end
