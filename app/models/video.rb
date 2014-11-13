class Video < ActiveRecord::Base
  validates :title,
    length: {in: 4..255, message: 'В названии видео должно быть от 4 до 255 символов.'}

  validates :youtube_hash,
    length: {is: 11, message: 'Идентификатор видео на Youtube должен состоять из 11 символов.'}
end
