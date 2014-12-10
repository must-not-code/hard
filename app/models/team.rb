class Team < ActiveRecord::Base
  mount_uploader :logo, TeamUploader

  has_many :users

  validates :title,
    uniqueness: {case_sensitive: false,
      message: 'Команда с таким названием уже существует.'},
    length: {in: 3..24,
      message: 'Название должно содержать от 3 до 24 символов.'}

  validates :tag,
    uniqueness: {case_sensitive: false,
      message: 'Команда с таким тэгом уже существует.'},
    length: {in: 2..6,
      message: 'Тэг должен содержать от 2 до 6 символов.'}
end
