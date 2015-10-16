source 'https://rubygems.org'

gem 'rails',                 '4.2.4'

# Database
gem 'pg'
gem 'nilify_blanks'

# Authentication
gem 'sorcery'

# Views
gem 'slim-rails'
gem 'html_truncator'

# JavaScript
gem 'jquery-rails'
gem 'coffee-rails'

# CSS
gem 'sass-rails'
gem 'bootstrap-sass'

# Icons
gem 'font-awesome-rails'

# Assets
gem 'uglifier',           '>= 1.3.0'
gem 'therubyracer'
gem 'quiet_assets'

# JSON
gem 'json'

# IRB alternative
gem 'pry-rails'

# WYSIWYG text editor
gem 'tinymce-rails'

# Pagination
gem 'kaminari'

# Upload files
gem 'carrierwave'
gem 'mini_magick'
gem 'tinymce-rails-imageupload',  '~> 4.0.0.beta'
gem 'remotipart',                 '~> 1.0'

# Administration
gem 'activeadmin',                github: 'activeadmin'

# Flags
gem 'famfamfam_flags_rails'
gem 'carmen-rails'

# Locale
gem 'rails-i18n'

# Stream
gem 'kappa'

# Backup
gem 'backup',                         require: false
gem 'dropbox-sdk',           '1.5.1', require: false
gem 'whenever',                       require: false

group :production do
  # Analytics
  gem 'newrelic_rpm',        '>= 3.8.1'
end

group :development do
  # Useful error page
  gem 'better_errors'
  gem 'binding_of_caller'

  # Deploy
  gem 'capistrano',       '~> 3.1',   require: false
  gem 'capistrano-rails', '~> 1.1.1', require: false
  gem 'capistrano-rvm',               require: false
end

group :development, :test do
  # Unit tests
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
end
