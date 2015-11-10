class PostsController < ApplicationController
  def index
    if logged_in? && current_user.group[/admin|newsman/]
      @posts = Post.joins('LEFT JOIN users ON users.id = posts.user_id')
                   .joins('LEFT JOIN comments ON comments.post_id = posts.id')
                   .select('posts.*, users.username AS author, count(comments.id) AS comments_count')
                   .group('posts.id, users.username')
                   .order('published_at desc').page(params[:page]).per(10)
    else
      @posts = Post.joins('LEFT JOIN users ON users.id = posts.user_id')
                   .joins('LEFT JOIN comments ON comments.post_id = posts.id')
                   .select('posts.*, users.username AS author, count(comments.id) AS comments_count')
                   .group('posts.id, users.username')
                   .where.not(published_at: nil)
                   .order('published_at desc').page(params[:page]).per(10)
    end
  end

  def show
    @post = Post.joins('LEFT JOIN users ON users.id = posts.user_id')
                .joins('LEFT JOIN comments ON comments.post_id = posts.id')
                .select('posts.*, users.username AS author, count(comments.id) AS comments_count')
                .group('posts.id, users.username')
                .find(params[:id])

    @comments = Comment.where(post_id: @post.id).includes(:user).order('created_at asc')
  end
end
