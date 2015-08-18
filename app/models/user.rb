class User < ActiveRecord::Base
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader

  has_many :comments
  has_many :posts

  validates :username,
            uniqueness: { case_sensitive: false },
            length: { in: 3..20 },
            format: { with: /\A[a-zа-яё0-9]+([_\s\-]?[a-zа-яё0-9])+\z/i }

  validates :email,
            uniqueness: { case_sensitive: false },
            format: { with: /\A.+@.+\..+\z/ },
            length: { in: 6..70 }

  validates :password,
            length: { in: 6..20 },
            confirmation: true,
            if: :password

  validates :skype,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[a-z][a-z0-9\.,\-_]{5,32}\z/i },
            allow_blank: true

  validates :name,
            length: { in: 2..3_000 },
            allow_blank: true

  validates :about,
            length: { in: 3..3_000 },
            allow_blank: true

  validates :vk,
            format: { with: /\Ahttps?:\/\/vk.com\/.{,30}\z/i },
            allow_blank: true

  validates :fb,
            format: { with: /\Ahttps?:\/\/www.facebook.com\/.{,30}\z/i },
            allow_blank: true

  validates :twitch,
            format: { with: /\Ahttps?:\/\/www.twitch.tv\/.{,30}\z/i },
            allow_blank: true

  validates :twitter,
            format: { with: /\Ahttps?:\/\/twitter.com\/.{,30}\z/i },
            allow_blank: true

  validates :site,
            format: { with: /\Ahttps?:\/\/.{,50}\z/i },
            allow_blank: true

  validates :nick_ru,
            length: { maximum: 30 },
            allow_blank: true

  validates :nick_euw,
            length: { maximum: 30 },
            allow_blank: true

  validates :city,
            length: { maximum: 30 },
            allow_blank: true

  validates :country,
            length: { is: 2 },
            allow_blank: true
end
