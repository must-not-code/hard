class Team < ActiveRecord::Base
  mount_uploader :logo, TeamUploader

  has_many :users
  has_many :invites

  validates :title,
    uniqueness: {case_sensitive: false,
      message: 'Команда с таким названием уже существует.'},
    length: {in: 3..24,
      message: 'Название должно содержать от 3 до 24 символов.'},
    format: {with: /\A[a-zа-яё0-9]+([_\s\-\.]?[a-zа-яё0-9])+\z/i,
      message: 'Логин может содержать только буквы латинского и кириллического алфавитов, цифры и символы между ними: пробел, тире, нижнее подчеркивание, точка.'}

  validates :tag,
    uniqueness: {case_sensitive: false,
      message: 'Команда с таким тэгом уже существует.'},
    length: {in: 2..6,
      message: 'Тэг должен содержать от 2 до 6 символов.'}
end
