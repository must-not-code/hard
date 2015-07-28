class Stream < ActiveRecord::Base
  validates :streamer,
    length: {in: 2..255, message: 'В названии стрима должно быть от 2 до 255 символов.'}

  validates :channel,
    length: {in: 2..255, message: 'В названии канала должно быть от 2 до 255 символов.'}

  def get_state
    stream = Twitch.streams.get(self.channel)
    if stream
      self.update(online: true, views: stream.viewer_count, banner_url: stream.video_banner_url)
    else
      self.update(online: false, views: 0)
    end
  end
end
