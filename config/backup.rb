#http://meskyanichi.github.io/backup/v4
#backup perform --trigger hard_backup

require 'yaml'

path = '/home/dev/hard/shared'
config = YAML.load_file("#{path}/config/secrets.yml")

Backup::Model.new(:hard_backup, 'HardRandom.com backup') do
  split_into_chunks_of 50

  archive :hard_archive do |archive|
    archive.add "#{path}/public/avatars"
    archive.add "#{path}/public/posts"
    archive.add "#{path}/public/members"
    archive.add "#{path}/public/carousels"
    archive.add "#{path}/public/partners"
  end

  database PostgreSQL do |db|
    db.name               = 'hardrandom'
    db.username           = config['production']['db_username']
    db.password           = config['production']['db_password']
    db.port               = 5432
  end

  store_with Dropbox do |db|
    db.api_key            = 'zenganherzp0gcz'
    db.api_secret         = config['production']['dropbox_secret']
    db.access_type        = :app_folder
    db.path               = '/'
    db.keep               = 14
  end

  store_with Local do |local|
    local.path            = '~/Backup/'
    local.keep            = 5
  end

  notify_by Mail do |mail|
    mail.on_success       = false
    mail.on_warning       = true
    mail.on_failure       = true

    mail.from             = 'backup@hardrandom.com'
    mail.to               = 'test4food@me.com'
    mail.address          = 'smtp.sendgrid.net'
    mail.port             = 587
    mail.user_name        = 'slowpoke'
    mail.password         = config['production']['mail_password']
    mail.domain           = 'hardrandom.com'
    mail.authentication   = 'plain'
    mail.encryption       = :starttls
  end
end
