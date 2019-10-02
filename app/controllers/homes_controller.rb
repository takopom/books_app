# frozen_string_literal: true

class HomesController < ApplicationController
  def show
    @posts = []
    relationships = Relationship.includes(:user).where(user_id: current_user.id)
    relationships.each do |relationship|
      user = User.where(id: relationship.followed_id).limit(1).first
      books = Book.where(user_id: relationship.followed_id)
      @posts.push({
        :user_id => user.id,
        :name => user.name,
        :avatar => user.avatar,
        :books => books
      })
    end
  end
end