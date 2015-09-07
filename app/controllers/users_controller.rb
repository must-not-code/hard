class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(username:              params['username'],
                     email:                 params['email'],
                     password:              params['password'],
                     password_confirmation: params['password_confirmation'])
    if @user.save
      login(params[:username], params[:password], true)
      render json: { url: root_path }
    else
      render json: { error: @user.errors.first[1] }
    end
  end

  def activate
    if @user = User.load_from_activation_token(params[:id])
      @user.activate!
      redirect_to(root_path, notice: t('controllers.users.successfully_activated'))
    else
      not_authenticated
    end
  end

  def show
    @user = User.find_by_username!(params[:id])
  end

  def edit
    @user = User.find_by_username!(params[:id])
    redirect_to user_path unless @user == current_user
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user
      if @user.update(name:      params['user']['name'],
                      country:   params['user']['country'],
                      city:      params['user']['city'],
                      nick_ru:   params['user']['nick_ru'],
                      nick_euw:  params['user']['nick_euw'],
                      skype:     params['user']['skype'],
                      vk:        params['user']['vk'],
                      fb:        params['user']['fb'],
                      site:      params['user']['site'],
                      twitch:    params['user']['twitch'],
                      twitter:   params['user']['twitter'],
                      email:     params['user']['email'],
                      about:     params['user']['about'],
                      avatar:    params['user']['file'])
        flash[:notice] = t('controllers.users.successfully_updated')
        render json: { url: user_path(@user.username) }
      else
        render json: { error: @user.errors.first[1] }
      end
    else
      head 403
    end
  end

  def change_password
    @user = User.find_by_username!(params[:id])
    redirect_to user_path unless @user == current_user
  end

  def update_password
    @user = User.find_by_username!(params[:id])
    if BCrypt::Password.new(@user.crypted_password) == params[:user][:old_password] + @user.salt
      @user.password_confirmation = params[:user][:password_confirmation]
      if @user.change_password!(params[:user][:password])
        flash[:notice] = t('controllers.users.password_updated')
        render json: { url: user_path(@user.username) }
      else
        render json: { error: @user.errors.first[1] }
      end
    else
      render json: { error: t('controllers.users.wrong_old_password') }
    end
  end
end
