class Video < ActiveRecord::Base
  validates :title,
            length: { in: 4..255 }

  validates :youtube_hash,
            length: { is: 11 }
end
