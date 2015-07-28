# https://github.com/javan/whenever
# http://meskyanichi.github.io/backup/v4/scheduling-backups
# whenever --update-crontab
# crontab -l
# crontab -r

every 1.day, at: '4:00 am' do
  command 'backup perform --trigger hard_backup'
end

every :minute do
  runner 'Stream.find_each { |stream| stream.get_state }'
end
