class Stream < ActiveRecord::Base
  before_save do
    self.banner_url = Twitch.channels.get(self.channel).video_banner_url
  end
end
