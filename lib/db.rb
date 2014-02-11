if settings.production?
  DataMapper.setup(:default, "postgres://dev:Hardp0rn@localhost/hardrandom")
else
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/dev.db")
end

class User
  include DataMapper::Resource
  include BCrypt

  property :id,         Serial
  property :created_at, DateTime
  property :username,   String
  property :password,   BCryptHash
  property :email,      String
  property :avatar,     String,    :default  => 'default_avatar'
  property :reputation, Integer,   :default  => 0
  property :tag,        String,    :default  => ''
  property :skype,      String,    :default  => ''
  property :about,      Text,      :default  => ''

  has n, :comments
  has n, :posts
  has n, :kinds
  has n, :tournaments, :through => :kinds

  def authenticate(attempted_password)
    if self.password == attempted_password
      true
    else
      false
    end
  end
end

class Tournament
include DataMapper::Resource

  property :id,         Serial
  property :created_at, DateTime
  property :title,      String
  property :date,       String
  property :content,    Text

  has n, :kinds
  has n, :users, :through => :kinds
end

class Kind
  include DataMapper::Resource

  property :id,         Serial
  property :created_at, DateTime
  property :kind,       String
  
  belongs_to :user
  belongs_to :tournament
end

class Post
  include DataMapper::Resource

  property :id,         Serial
  property :created_at, DateTime
  property :title,      String
  property :content,    Text

  has n, :comments
  belongs_to :user
end

class Comment
  include DataMapper::Resource

  property :id,         Serial
  property :created_at, DateTime
  property :content,    Text

  belongs_to :post
  belongs_to :user
end

DataMapper.finalize.auto_upgrade!
