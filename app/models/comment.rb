class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Call back
  after_save :update_comment_counter_of_post

  # Methods
  def update_comment_counter_of_post
    Post.increment!(:Comments_counter)
  end
end
