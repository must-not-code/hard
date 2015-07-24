class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    @user.deliver_reset_password_instructions! if @user
    redirect_to(root_path, notice: t('controllers.users.email_was_sent'))
  end

  def edit
    @user = User.load_from_reset_password_token(params[:id])
    @token = params[:id]
    not_authenticated if @user.blank?
  end

  def update
    if @user = User.load_from_reset_password_token(params[:token])
      @user.password_confirmation = params[:user][:password_confirmation]
      if @user.change_password!(params[:user][:password])
        login(@user.username, params[:user][:password], true)
        flash[:notice] = t('controllers.users.password_updated')
        render json: { url: user_path(@user.username) }
      else
        render json: { error: @user.errors.first[1] }
      end
    else
      head 403
    end
  end
end
