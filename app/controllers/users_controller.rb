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
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(root_path, notice: 'Аккаунт успешно активирован.')
    else
      not_authenticated
    end
  end

  def show
    @user = User.find_by_username(params[:id])
  end

  def edit
    @user = User.find_by_username(params[:id])
    unless @user == current_user
      redirect_to user_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user
      if @user.update(firstname: params['user']['firstname'],
                      lastname:  params['user']['lastname'],
                      nick_ru:   params['user']['nick_ru'],
                      nick_euw:  params['user']['nick_euw'],
                      skype:     params['user']['skype'],
                      vk:        params['user']['vk'],
                      fb:        params['user']['fb'],
                      site:      params['user']['site'],
                      twitch:    params['user']['twitch'],
                      twitter:   params['user']['twitter'],
                      tag:       params['user']['tag'],
                      email:     params['user']['email'],
                      about:     params['user']['about'],
                      avatar:    params['file']['0'])
        flash[:notice] = 'Данные обновлены.'
        render json: { success: true, url: user_path(@user.username) }
      else
        render json: { error: @user.errors.first[1] }
      end
    else
      head 403
    end
  end

  def change_password
    @user = current_user
    if @user.blank?
      not_authenticated
      return
    end
  end

  def update_password
    @user = current_user
    if @user.blank?
      not_authenticated
      return
    end
    if BCrypt::Password.new(@user.crypted_password) == params[:user][:old_password] + @user.salt
      @user.password_confirmation = params[:user][:password_confirmation]
      if @user.change_password!(params[:user][:password])
        redirect_to(root_path, notice: 'Пароль успешно обновлён.')
      else
        render action: 'change_password'
      end
    else
      redirect_to(change_password_path, notice: 'Неправильный старый пароль!')
    end
  end
end
