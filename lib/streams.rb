require 'kappa'

begin
  loop do
    Stream.all.each do |stream|
      new_data = Twitch.streams.get(stream.channel)
      if new_data.nil?
        stream.update(online: false, views: 0)
      else
        stream.update(online: true, views: new_data.viewer_count)
      end
    end
    sleep 60
  end
rescue Twitch::Error
  retry
end
