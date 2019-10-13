# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  paginates_per 10
  belongs_to :user
  validates :user_id, presence: true
end
