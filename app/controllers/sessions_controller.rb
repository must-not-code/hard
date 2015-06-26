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
        render json: { error: t('controllers.login.too_much_attempts') }
      else
        render json: { error: t('controllers.login.wrong_credentials') }
      end
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
