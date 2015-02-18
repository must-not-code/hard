class Member < ActiveRecord::Base
  belongs_to :crew

  mount_uploader :photo, MemberUploader
end
