class Post < ActiveRecord::Base
  validates :content,
    length: {minimum: 140, maximum: 30000, too_short: 'Это вам не твиттер!', too_long: 'Слишком многа букаф!!!111'}

  validates :title,
    length: {in: 2..255, message: 'Посту нужен заголовок адекватной длины!'}

  validates :game,
    length: {in: 2..24, message: 'Пост должен относиться к какой-то игре!'}

  has_many :comments
  belongs_to :user
end
