class Member < ActiveRecord::Base
  belongs_to :team

  mount_uploader :photo, MemberUploader
end
