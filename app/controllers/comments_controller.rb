# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :ser_comments, only: [:index, :show]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @comment = @commentable.comments.new
  end

  def edit
  end

  def create
    @comment = @commentable.comments.new(comment_params)

    if @comment.save!
      redirect_to @commentable, notice: I18n.t("messages.comments.successfully_created")
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @commentable, notice: I18n.t("messages.comments.successfully_updated")
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @commentable, notice: I18n.t("messages.comments.successfully_destroyed")
  end

  private
    def set_comments
      @comments = @commentable.comments
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :user_id)
    end
end
