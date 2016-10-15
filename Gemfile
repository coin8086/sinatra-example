source 'https://rubygems.org'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-activerecord'
# If you want mysql, replace the pg gem with a mysql gem, and change
# the "adapter" in config/database.yml.
gem 'pg'
gem 'rake'

group :development, :test do
  gem 'byebug'
  gem 'thin'
end

group :test do
  gem 'minitest'
  gem 'rack-test'
end

group :deployment do
  gem 'capistrano', '~> 3.3.0'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rvm'
end

