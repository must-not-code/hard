class Post < ActiveRecord::Base
  validates :content,
            length: { minimum: 140,
                      maximum: 30_000 }

  validates :title,
            length: { in: 2..255 }

  validates :game,
            length: { in: 2..24 }

  has_many :comments
  belongs_to :user
end
