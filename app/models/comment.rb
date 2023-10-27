class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Callback
  after_create :update_comment_counter_of_post

  # Method
  def update_comment_counter_of_post
    post.increment!(:Comments_counter)
  end
end
