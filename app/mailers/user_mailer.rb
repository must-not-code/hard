class UserMailer < ActionMailer::Base
  default from: 'mailer@hardrandom.com'

  def activation_needed_email(user)
    @user = user
    @url  = "http://hardrandom.com/#{I18n.locale}/users/#{user.activation_token}/activate"
    mail(to: user.email,
         subject: t('mails.activation_email.subject'))
  end

  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(I18n.locale, user.reset_password_token)
    mail(to: user.email,
         subject: t('mails.reset_password_email.subject'))
  end
end
