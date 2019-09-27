# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])
  end
end