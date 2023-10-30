class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  # Validation
  validates :Title, presence: true, length: { maximum: 250 }
  validates :Comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :Likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  # Call back
  after_save :update_user_post_counter

  def update_user_post_counter
    author.increment!(:Posts_counter)
  end

  def five_recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
