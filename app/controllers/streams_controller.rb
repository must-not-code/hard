class StreamsController < ApplicationController
  def index
    @streams = Stream.order(views: :desc)
  end

  def show
    @stream = Stream.find_by_channel(params[:channel])
  end
end
