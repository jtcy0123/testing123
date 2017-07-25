class CommentsController < ApplicationController
  def create
    # "comment"=>{"text"=>"lalala", "user_id"=>"1", "content_id"=>"1", "mood"=>"2"}
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to content_path(params[:comment][:mood])
    else
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :content_id)
  end
end
