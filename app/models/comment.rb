class Comment < ApplicationRecord
  belongs_to :UserId
  belongs_to :PostId
end
