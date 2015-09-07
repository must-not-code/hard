class VideosController < ApplicationController
  def index
    @videos = Video.order('created_at DESC').page(params[:page]).per(10)
  end

  def show
    @video = Video.find_by_youtube_hash!(params[:id])
  end
end
