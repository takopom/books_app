class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymophic: true
end
