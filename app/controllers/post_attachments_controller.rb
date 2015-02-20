class PostAttachmentsController < ApplicationController
  def create
    if logged_in? && current_user.group[/admin/]
      @post_attachment = PostAttachment.new(image: params[:file])
      if @post_attachment.save
        render json: {
          image: {
            url: @post_attachment.image.url
          }
        }, content_type: 'text/html'
      else
        render json: {
          error: {
            message: 'Не надо загружать всякие непотребности!'
          }
        }, content_type: 'text/html'
      end
    else
      head 403
    end
  end

  def destroy
  end
end
