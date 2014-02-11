#!/usr/bin/env ruby

class HardRandom < Sinatra::Base
  set :show_exceptions, false if settings.production?

  get '/login' do
    haml :login
  end

  post '/login' do
    env['warden'].authenticate!
  end

  get '/logout' do
    env['warden'].raw_session.inspect
    env['warden'].logout
    redirect '/login'
  end

  post '/unauthenticated' do
    session[:return_to] = env['warden.options'][:attempted_path]
    'Неверный логин или пароль!'
  end

  get '/' do
    @post = Post.all(:order => [:id.desc], :limit => 10)
    haml :index
  end

  get '/tournaments' do
    @tournament = Tournament.all(:order => [:id.desc])
    haml :tournaments
  end

  get '/tournament/:id' do
    @tournament = Tournament.get(params[:id])
    haml :tourney
  end

  post '/tournament/signin' do
    user = env['warden'].user
    if user.skype == '' or user.tag == ''
      return 'Вам необходимо указать свой Skype и BattleTag в настройках профиля.'
    end
    tournament = Tournament.get(params[:id])
    if tournament.users.first(id: user.id)
      return 'Вы уже записаны на этот турнир.'
    end
    if tournament.users.count >= 64
      return 'К сожалению, в этом турнире не осталось свободных мест.'
    end
    tournament.users << user
    tournament.save
    user.kinds.first(tournament_id: tournament.id).update(kind: params[:kind])
  end

  post '/tournament/signout' do
    Tournament.get(params[:id]).kinds.first(user_id: env['warden'].user.id).destroy
  end

  get '/stream' do
    haml :stream_preview
  end

  get '/stream/:streamer' do
    @streamer = params[:streamer]
    haml :stream
  end

  get '/rules' do
    haml :rules
  end

  get '/user/:name' do
    @user = User.first(username: params[:name])
    haml :user
  end

  get '/user/edit/:name' do
    @user = User.first(username: params[:name])
    if @user == env['warden'].user
      haml :edit_user
    else
      redirect '/'
    end
  end

  post '/user/change_avatar/:id' do
    user = User.get(params[:id])
    if user == env['warden'].user
      avatar_id = Digest::SHA1.hexdigest(user.username + Time.now.to_i.to_s)[8..16]
      if user.avatar != 'default_avatar'
        File.delete("public/avatars/#{user.avatar}")
      end
      File.open('public/avatars/' + avatar_id, "w") do |file|
        file.write(params['file'][:tempfile].read)
      end
      user.update(avatar: avatar_id)
    end
    redirect "/user/#{user.username}"
  end

  post '/user/edit/:id' do
    @user = User.get(params[:id])
    if @user == env['warden'].user
      user_edit_error = user_edit_validation(params)
      if user_edit_error
        return user_edit_error
      else
        @user.update(tag:   params['tag'],
                     skype: params['skype'],
                     email: params['email'],
                     about: params['about'])
      end
    end
  end

  get '/signup' do
    haml :signup
  end

  post '/signup' do
    signup_error = signup_validation(params)
    if signup_error
      return signup_error
    else
      User.create(username: params['username'],
                  password: params['password'],
                  email:    params['email'])
      env['warden'].authenticate!
      send_email(params['username'], params['email'], 'signup')
    end
  end

  get '/post/:id' do
    @post = Post.get(params[:id])
    haml :post
  end

  post '/comment/create' do
    if User.get(params[:user]) == env['warden'].user
      comment_error = comment_validation(params[:text])
      if comment_error
        return comment_error
      else
        comment = Comment.create(content: params[:text],
                                 user_id: params[:user],
                                 post_id: params[:post])
      end
    end
  end

  post '/comment/delete' do
    comment = Comment.get(params[:id])
    if User.get(comment.user_id) == env['warden'].user
      comment.destroy
    end
  end

  not_found do
    haml :page404, layout: false
  end

  error do
    redirect '/'
  end
end
