class SessionsController < ApplicationController
  def new
    gon.push({root_path: root_path, login_path: login_path})
  end

  def create
    if @user = login(params[:username],
                     params[:password],
                     params[:remember] == 'true' ? true : false)
      render json: {success: true}
    else
      user = User.find_by(username: params[:username])
      if user && user.lock_expires_at
        render json: {success: false,
                      errors: 'Превышено допустимое число попыток.<br>Вход ограничен на 30 секунд.'}
      else
        render json: {success: false,
                      errors: 'Неверный логин или пароль!'}
      end
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
