class Stream < ActiveRecord::Base
  mount_uploader :banner, StreamBannerUploader

  validates :streamer,
            length: { in: 2..255 }

  validates :channel,
            length: { in: 2..255 }

  def get_state
    stream = Twitch.streams.get(channel)
    if stream
      update(online: true, views: stream.viewer_count)
    else
      update(online: false, views: 0)
    end
  rescue Twitch::Error::ServerError
  end
end
