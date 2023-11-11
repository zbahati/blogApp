class LikesController < ApplicationController
  load_and_authorize_resource
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = Like.new(user_id: @user.id, post_id: @post.id)

    if @like.save
      redirect_to user_post_path(@user, @post, @like)
    else
      render 'new'
    end
  end
end
