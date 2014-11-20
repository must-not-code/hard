class UsersController < ApplicationController
  def new
    gon.push({root_path: root_path, users_path: users_path})
  end

  def create
    @user = User.new(username: params['username'],
                     email: params['email'],
                     password: params['password'],
                     password_confirmation: params['password_confirmation'])
    if @user.save
      login(params[:username], params[:password], true)
      render json: {success: true}
    else
      render json: {success: false,
                    errors: @user.errors.first[1]}
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
    @user = User.find_by(username: params[:id])
  end

  def edit
    @user = User.find_by(username: params[:id])
    unless @user == current_user
      redirect_to user_path
    end
    gon.user_path = user_path(@user.username)
  end

  def update
    @user = User.find(params[:id])
    params.permit!
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_path(@user.username), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
   # @user = User.find_by(username: params[:username])
   # if @user == current_user
   #   if @user.update(tag:   params['tag'],
   #                   skype: params['skype'],
   #                   email: params['email'],
   #                   about: params['about'])
   #     render json: {success: true}
   #   else
   #     render json: {success: false,
   #                   errors: @user.errors.first[1]}
   #   end
   # else
   #   head 403
   # end
  end

  def avatar
    @user = User.find_by(username: params[:username])
    if @user == current_user
      avatar_id = Digest::SHA1.hexdigest(@user.username + Time.now.to_i.to_s)[8..16]
      if @user.avatar != 'default_avatar'
        File.delete("public/avatars/#{@user.avatar}")
      end
      File.open('public/avatars/' + avatar_id, "wb") do |file|
        file.write(params['file'].read)
      end
      @user.update(avatar: avatar_id)
      redirect_to user_path
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

  private

  def user_params
    params.require(:user).permit(:tag, :about, :skype, :email, :avatar, :avatar_cache)
  end
end
