source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

gem 'rails', '~> 6.1.6', '>= 6.1.6.1'

gem 'twitter-bootstrap-rails'

gem 'puma', '~> 3.11'

gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'

gem 'devise'
gem 'devise-i18n'
gem 'russian'
gem 'rails-i18n', '~> 6.0'

gem 'aws-sdk-s3', require: false
gem 'carrierwave'
gem 'fog-aws'
gem 'rmagick'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'image_processing', '~> 1.2'
  gem 'rubocop'
  gem 'sqlite3'
  gem 'web-console'
end

group :production do
  gem 'pg'
end

group :development do
  gem 'listen'
end
