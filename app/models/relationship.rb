# frozen_string_literal: true

class Relationship < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :user_id, presence: true
  validates :followed_id, presence: true
end
