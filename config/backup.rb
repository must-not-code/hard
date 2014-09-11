#http://meskyanichi.github.io/backup/v4
#backup perform --trigger hard_backup

Backup::Model.new(:hard_backup, 'HardRandom.com backup') do
  split_into_chunks_of 50

  archive :hard_archive do |archive|
    archive.add '/home/dev/hard/shared/public/avatars'
    archive.add '/home/dev/hard/shared/public/posts'
    archive.add '/home/dev/hard/shared/public/photos'
  end

  database PostgreSQL do |db|
    db.name                    = 'hardrandom'
    db.username                = 'dev'
    db.password                = ENV['DB_PASSWORD']
    db.host                    = 'localhost'
    db.port                    = 5432
  end

  store_with Dropbox do |db|
    db.api_key                 = 'zenganherzp0gcz'
    db.api_secret              = ENV['DROPBOX_SECRET']
    db.access_type             = :app_folder
    db.path                    = '/'
    db.keep                    = 14
  end

  store_with Local do |local|
    local.path                 = '~/Backup/'
    local.keep                 = 5
  end

  notify_by Mail do |mail|
    mail.on_success            = false
    mail.on_warning            = true
    mail.on_failure            = true

    mail.from                  = 'mailer@hardrandom.com'
    mail.to                    = 'test4food@me.com'
    mail.address               = 'mail.hardrandom.com'
    mail.port                  = 587
    mail.user_name             = 'mailer'
    mail.password              = ENV['MAIL_PASSWORD']
    mail.domain                = 'hardrandom.com'
    mail.authentication        = 'plain'
    mail.encryption            = :starttls
    mail.openssl_verify_mode   = 'none'
  end
end
