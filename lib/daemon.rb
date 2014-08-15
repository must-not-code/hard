require 'daemons'
#http://daemons.rubyforge.org/Daemons.html

options = {
  monitor:   true,
  backtrace: true,
  dir_mode:  :normal,
  dir:       '/home/dev/hard/current/tmp'
}

Daemons.run('/home/dev/hard/current/lib/streams.rb', options)
