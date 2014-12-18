class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = login(params[:username],
                     params[:password],
                     params[:remember] == 'on' ? true : false)
      render json: { url: root_path }
    else
      user = User.find_by_username(params[:username])
      if user && user.lock_expires_at
        render json: { error: 'Превышено допустимое число попыток.<br>Вход ограничен на 30 секунд.' }
      else
        render json: { error: 'Неверный логин или пароль!' }
      end
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
