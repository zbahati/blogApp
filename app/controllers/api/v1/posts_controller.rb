class Api::V1::PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @post = current_user.posts
    render json: @post, pretty: true
  end
end
