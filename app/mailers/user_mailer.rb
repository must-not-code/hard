class UserMailer < ActionMailer::Base
  default from: 'info@hardrandom.com'

  def activation_needed_email(user)
    @user = user
    @url  = "http://hardrandom.com/users/#{user.activation_token}/activate"
    mail(to: user.email,
         subject: 'Регистрация на HardRandom.com')
  end

  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(user.reset_password_token)
    mail(to: user.email,
         subject: 'Сброс пароля на HardRandom.com')
  end
end
