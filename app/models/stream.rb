class Stream < ActiveRecord::Base
  before_save do
    stream = Twitch.channels.get(self.channel)
    if stream
      self.banner_url = stream.video_banner_url
    end
  end

  validates :streamer,
    length: {in: 2..255, message: 'В названии стрима должно быть от 2 до 255 символов.'}

  validates :channel,
    length: {in: 2..255, message: 'В названии канала должно быть от 2 до 255 символов.'}
end
