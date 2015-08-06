class User < ActiveRecord::Base
  authenticates_with_sorcery!

  before_save :fix_urls

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

  validates :about,
            length: { minimum: 3, maximum: 3_000 },
            allow_blank: true

  private

  def fix_urls
    %w(vk fb site twitch twitter).each do |column|
      send("#{column}=", (send(column)[/^$|https?:\/\//] ? '' : 'http://') + send(column)) if send(column)
    end
  end
end
