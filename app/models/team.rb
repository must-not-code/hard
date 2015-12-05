class Team < ActiveRecord::Base
  mount_uploader :logo, TeamLogoUploader
  has_many :members
end
