class PostsController < ApplicationController
  def index
    @posts = Post.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    gon.push({post_id: @post.id,
              post_path: post_path(@post.id),
              comments_path: comments_path})
  end

  def new
    if logged_in? && current_user.group[/admin|newsman/]
      gon.push({post: {title: nil, game: nil, id: nil},
                post_path: root_path,
                post_save: post_save_path})
      render 'edit.html.haml'
    else
      head 403
    end
  end

  def edit
    if logged_in? && current_user.group[/admin|newsman/]
      @post = Post.find(params[:id])
      gon.push({post: @post,
                post_path: post_path(@post.id),
                post_save: post_save_path})
      render 'edit.html.haml'
    else
      head 403
    end
  end

  def save
    if logged_in? && current_user.group[/admin|newsman/]
      if params[:post].empty?
        @post = Post.create(user_id: current_user.id,
                            title:   params[:title],
                            game:    params[:game],
                            content: params[:text].gsub('alt="zoom"', 'rel="zoom"'))
      else
        @post = Post.find(params[:post])
        @post.update(title:   params[:title],
                     game:    params[:game],
                     content: params[:text].gsub('alt="zoom"', 'rel="zoom"'))
      end

      if @post.errors.empty?
        render json: {success: true}
      else
        render json: {success: false,
                      errors: @post.errors.first[1]}
      end
    else
      head 403
    end
  end

  def upload
    if logged_in? && current_user.group[/admin|newsman/]
      img = Digest::SHA1.hexdigest(current_user.username + Time.now.to_i.to_s)[8..16]
      path = 'public/posts/' + img + params[:file].original_filename[/\.[^.]+\z/]
      File.open(path, "wb") do |file|
        file.write(params[:file].read)
      end
      render text: "Ссылка на этот файл <strong>#{path[/(?<=public).*/]}</strong>"
    else
      head 403
    end
  end
end
