class Stream < ActiveRecord::Base
  before_save do
    stream = Twitch.channels.get(self.channel)
    if stream
      self.banner_url = stream.video_banner_url
    end
  end
end
