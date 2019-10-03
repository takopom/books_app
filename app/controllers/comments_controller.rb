class CommentsController < ApplicationController
  def create
    report = Report.find(params[:report_id])
    @comment = Comment.new(comment_params)
    @comment.commentable_id = report.id
    @comment.commentable_type = report.class.to_s

    if @comment.save!
      flash[:notice] = "コメントしました"
    else
      flash[:notice] = "コメント投稿に失敗しました"
    end

    redirect_back fallback_location: reports_path(params[:report_id])
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id)
    end
end
