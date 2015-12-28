class Page < ActiveRecord::Base
  validates :title,
            length: { in: 2..20 }

  validates :content_ru,
            length: { maximum: 10_000 }

  validates :content_en,
            length: { maximum: 10_000 }
end
