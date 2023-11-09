class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  # validation

  validates :Name, presence: true
  validates :Posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  # methods
  def three_most_recent_post
    Post.where(author_id: self).order(created_at: :desc).first(3)
  end
end
