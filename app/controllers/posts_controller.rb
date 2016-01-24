class PostsController < ApplicationController
  def index
    @posts = Post.joins('LEFT JOIN users ON users.id = posts.user_id')
                 .joins('LEFT JOIN comments ON comments.post_id = posts.id')
                 .select('posts.*, users.username AS author, count(comments.id) AS comments_count')
                 .group('posts.id, users.username')
                 .where('published_at < :now', now: Time.zone.now)
                 .order('published_at desc').page(params[:page]).per(12)
  end

  def show
    @post = Post.joins('LEFT JOIN users ON users.id = posts.user_id')
                .joins('LEFT JOIN comments ON comments.post_id = posts.id')
                .select('posts.*, users.username AS author, count(comments.id) AS comments_count')
                .group('posts.id, users.username')
                .find(params[:id])

    # increment views without touch updated_at
    @post.update_column(:views, @post.views + 1)

    @comments = Comment.where(post_id: @post.id).includes(:user).order('created_at asc')

    @last_posts = Post.joins('LEFT JOIN comments on comments.post_id = posts.id')
                      .select('posts.id, posts.title, count(comments.id) as comments_count')
                      .group('posts.id')
                      .where.not(published_at: nil)
                      .order('published_at desc')
                      .limit(6)
  end
end
