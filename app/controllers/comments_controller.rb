class CommentsController < ApplicationController
  def create
    if logged_in?
      @comment = Comment.new(content: params[:text],
                             post_id: params[:post],
                             user_id: current_user.id)
      if @comment.save
        render json: {success: true}
      else
        render json: {success: false,
                      errors: @comment.errors.first[1]}
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
      head 200
    else
      head 403
    end
  end
end
