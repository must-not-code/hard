class Comment < ActiveRecord::Base
  validates :content,
            length: { in: 4..3000 }

  belongs_to :user
  belongs_to :post
end
