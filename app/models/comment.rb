class Comment < ActiveRecord::Base
  validates :content, 
    length: {minimum: 4, maximum: 3000, too_short: 'Ваш комментарий недостаточно информативен.', too_long: 'Недопустимое количество символов.'}

  belongs_to :user
  belongs_to :post
end
