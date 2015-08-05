FactoryGirl.define do
  factory :user do
    username 'dno'
    email { "#{username}@mail.ru".downcase }
    skype 'dnoskype'
    tag 'dno#1234'
    about 'hard noob'
    rating 0
    group 'admin'
    avatar 'default_avatar'
    salt 'pepper'
    crypted_password Sorcery::CryptoProviders::BCrypt.encrypt('secret', 'pepper')
    remember_me_token nil
    remember_me_token_expires_at nil
    activation_state 'active'
    activation_token nil
    activation_token_expires_at nil
    failed_logins_count 0
    lock_expires_at nil
    unlock_token nil
    reset_password_token nil
    reset_password_token_expires_at nil
    reset_password_email_sent_at nil
  end
end
