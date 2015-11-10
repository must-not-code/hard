class Stream < ActiveRecord::Base
  validates :streamer,
            length: { in: 2..255 }

  validates :channel,
            length: { in: 2..255 }

  def get_state
    stream = Twitch.streams.get(self.channel)
    if stream
      self.update(online: true, views: stream.viewer_count, banner_url: stream.channel.video_banner_url)
    else
      self.update(online: false, views: 0)
    end
  rescue Twitch::Error::ServerError
  end
end
