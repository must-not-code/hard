class PostsController < ApplicationController
  def index
    if logged_in? && current_user.group[/admin|newsman/]
      @posts = Post.order('published_at desc').page(params[:page]).per(10)
    else
      @posts = Post.where.not(published_at: nil).order('published_at desc').page(params[:page]).per(10)
    end
  end

  def show
    @post = Post.find(params[:id])
    gon.push({post_id: @post.id,
              post_path: post_path(@post.id),
              comments_path: comments_path})
  end
end
