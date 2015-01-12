#https://github.com/javan/whenever
#http://meskyanichi.github.io/backup/v4/scheduling-backups
#whenever --update-crontab
#crontab -l
#crontab -r

every 1.day, :at => '4:00 am' do
  command 'cd /home/dev/hard/current && rails r backup perform --trigger hard_backup'
end

every :reboot do
  command 'cd /home/dev/hard/current && rails r lib/daemon.rb restart'
end
