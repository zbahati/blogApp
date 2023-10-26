class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_user_post_counter
  # Method to update the user's post counter
  def update_user_post_counter
    author.increment!(:Posts_counter)
  end

  def five_recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
