class HomeController < ApplicationController
  def index
    @carousels = Carousel.order(:position)
    @events = Event.order(start_at: :desc).limit(5)
    @posts = Post.joins('LEFT JOIN users ON users.id = posts.user_id')
                 .joins('LEFT JOIN comments ON comments.post_id = posts.id')
                 .select('posts.*, users.username AS author, count(comments.id) AS comments_count')
                 .group('posts.id, users.username')
                 .where('published_at < :now', now: Time.zone.now)
                 .order('published_at desc').limit(6)
    @streams = Stream.order(views: :desc).limit(3)
    @videos = Video.order(created_at: :desc).limit(3)
  end
end
