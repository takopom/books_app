# frozen_string_literal: true

class User < ApplicationRecord
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :books, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def follow(other)
    active_relationships.create(followed_id: other.id)
  end

  def following?(other)
    following.include?(other)
  end

  def unfollow(other)
    active_relationships.find_by(followed_id: other.id).destroy
  end
end
