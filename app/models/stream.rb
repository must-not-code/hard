class Stream < ActiveRecord::Base
  def receive_banner_url
    self.update(banner_url: Twitch.channels.get(self.channel).video_banner_url)
  end
end
