class Team < ActiveRecord::Base
  mount_uploader :logo, TeamUploader

  has_many :users

  validates :title,
    uniqueness: {case_sensitive: false,
      message: 'Команда с таким названием уже существует.'},
    length: {in: 2..30,
      message: 'Название должно содержать от 2 до 30 символов.'}

  validates :tag,
    uniqueness: {case_sensitive: false,
      message: 'Команда с таким тэгом уже существует.'},
    length: {in: 2..10,
      message: 'Тэг должен содержать от 2 до 10 символов.'}
end
