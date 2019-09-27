# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = Relationship.find_by(followed_id: params[:followed_id]).followed
    current_user.unfollow(user)
    redirect_to user
  end
end
