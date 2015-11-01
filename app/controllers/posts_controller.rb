class PostsController < ApplicationController
  def index
    if logged_in? && current_user.group[/admin|newsman/]
      @posts = Post.joins(:user).select('posts.*, users.username as author')
                   .order('published_at desc')
                   .page(params[:page]).per(10)
    else
      @posts = Post.joins(:user).select('posts.*, users.username as author')
                  .where.not(published_at: nil).order('published_at desc')
                  .page(params[:page]).per(10)
    end
  end

  def show
    @post = Post.joins(:user).select('posts.*, users.username as author')
                .find(params[:id])
    @comments = @post.comments.joins(:user)
                     .select('comments.*, users.username as author, users.avatar')
                     .order('created_at asc')
  end
end
