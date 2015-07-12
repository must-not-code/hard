class Partner < ActiveRecord::Base
  mount_uploader :logo, PartnerLogoUploader
  mount_uploader :site_icon, PartnerIconUploader
end
