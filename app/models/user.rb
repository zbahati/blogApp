class User < ApplicationRecord
  has_many :post, class_name: 'Post', foreign_key: 'author_id'
  has_many :comment
  has_many :like

  # methods
  def three_most_recent_post
    Post.where(Author_id: self).order(create_at: :desc).first(3)
  end
end
