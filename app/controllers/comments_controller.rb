class CommentsController < ApplicationController
  def create
    if logged_in?
      @comment = Comment.new(content: params[:text],
                             post_id: params[:post_id],
                             user_id: current_user.id)
      if @comment.save
        render json: { div: '#comments', load: post_path(params[:post_id]) }
      else
        render json: { error: @comment.errors.first[1] }
      end
    else
      head 403
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if logged_in? &&
    current_user.id == @comment.user_id &&
    Time.parse(@comment.created_at.to_s) > Time.now - 10*60
      @comment.destroy
      render json: { div: '#comments', load: post_path(params[:post_id]) }
    else
      head 403
    end
  end
end
