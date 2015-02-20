class PostAttachment < ActiveRecord::Base
   mount_uploader :image, PostUploader
end
