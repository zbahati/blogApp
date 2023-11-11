class Api::V1::CommentsController < ApplicationController
  load_and_authorize_resource

  def index
    @post = Post.includes(:comments).find(params[:post_id])
    @comments = @post.comments
    render json: { success: true, data: { comments: @comments } }
  end

  def create
    @post= Post.find(parmas[:post_id])
    @comment = @post.comments.new(Text: comments_params[:Text])
    @comment.user = current_user

    if @comment.save
      render json: { success: true, data: { comment: @comment, user: current_user } }, status: :created
    else
      render json: { success: false, errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def comments_params
    params.require(:comments).permit(:Text)
  end
end
