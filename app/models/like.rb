class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Callbacks
  after_save :update_post_likes_counter

  # Methods
  def update_post_likes_counter
    post.increment!(:Likes_counter)
  end
end
