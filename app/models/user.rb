class User < ActiveRecord::Base
  authenticates_with_sorcery!

  before_save :fix_urls

  mount_uploader :avatar, AvatarUploader

  has_many   :comments
  has_many   :posts

  validates :username,
    uniqueness: {case_sensitive: false,
      message: 'Пользователь с таким логином уже зарегистрирован.'},
    length: {in: 3..20,
      message: 'Логин должен содержать от 3 до 20 символов.'},
    format: {with: /\A[a-zа-яё0-9]+([_\s\-]?[a-zа-яё0-9])+\z/i,
      message: 'Логин может содержать только буквы латинского и кириллического алфавитов, цифры и символы между ними: пробел, тире, нижнее подчеркивание.'}

  validates :email,
    uniqueness: {case_sensitive: false,
      message: 'Пользователь с таким Email уже зарегистрирован.'},
    format: {with: /\A.+@.+\..+\z/,
      message: 'Некорректный Email.'},
    length: {in: 6..70,
      message: 'Некорректная длина Email.'}

  validates :password,
    length: {in: 6..20,
      message: 'Пароль должен содержать от 6 до 20 символов.'},
    confirmation: {message: 'Пароли не совпадают.'},
    if: :password

  validates :skype,
    uniqueness: {case_sensitive: false,
      message: 'Пользователь с таким Skype уже зарегистрирован.'},
    format: {with: /\A[a-z][a-z0-9\.,\-_]{5,32}\z/i,
      message: 'Некорректный Skype.'},
    allow_blank: true

  validates :tag,
    uniqueness: {case_sensitive: false,
      message: 'Пользователь с таким BattleTag уже зарегистрирован.'},
    format: {with: /\A[a-zа-яё][a-zа-яё0-9]{2,11}#[0-9]{3,5}\z/i,
      message: 'Некорректный BattleTag.'},
    allow_blank: true

  validates :about,
    length: {minimum: 3, maximum: 3000,
      too_short: 'Не скромничайте. Оставьте о себе больше трех букв.',
      too_long: 'Недопустимое количество символов.'},
    allow_blank: true

  private
  def fix_urls
    %w(vk fb site twitch twitter).each do |column|
      self.send("#{column}=", (self.send(column)[/^$|https?:\/\//] ? '' : 'http://') + self.send(column)) if self.send(column)
    end
  end
end
