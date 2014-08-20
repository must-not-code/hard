source 'https://rubygems.org'

gem 'rails',                 '4.1.5'

# Database
gem 'pg'

# Authentication
gem 'sorcery'

# Views
gem 'haml-rails'
gem 'gon'

# JavaScript
gem 'jquery-rails'
gem 'coffee-rails',       '~> 4.0.0'

# CSS
gem 'sass-rails',         '~> 4.0.2'
gem 'bootstrap-sass',     '~> 3.1.1'

# Icons
gem 'font-awesome-rails'

# Compression
gem 'uglifier',           '>= 1.3.0'
gem 'therubyracer'

# JSON
gem 'json'

# IRB alternative
gem 'pry-rails'

# WYSIWYG text editor
gem 'tinymce-rails'

# Pagination
gem 'kaminari'

# Stream
gem 'daemons',                        require: false
gem 'kappa',                          require: false

# Backup
gem 'backup',                         require: false
gem 'dropbox-sdk',           '1.5.1', require: false
gem 'whenever',                       require: false

group :production do
  # Analytics
  gem 'newrelic_rpm',     '>= 3.8.1'
end

group :development do
  # Useful error page
  gem 'better_errors'

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
