class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comment_params)

    if @comment.save!
      notice = I18n.t("messages.successfully_commented")
    else
      notice = I18n.t("messages.unsuccessfully_commented")
    end

    redirect_to @commentable, notice: notice
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id)
    end
end
