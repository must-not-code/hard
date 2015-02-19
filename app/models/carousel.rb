class Carousel < ActiveRecord::Base
  mount_uploader :image, CarouselUploader
end
