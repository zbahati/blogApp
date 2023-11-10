class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.includes(posts: %i[comments likes]).find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
z
  def new
    @user = current_user
    @post = @user.posts.build
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_post_path(@user, @post)
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.includes(:likes).find(params[:id])
    @author = @post.author
    @author.decrement!(:Posts_counter)
    @post.likes.destroy_all
    @post.destroy!

    redirect_to user_posts_path(@author.id), notice: 'Post successfully deleted'
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
