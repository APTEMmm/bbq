source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

gem 'rails', '~> 6.1.6', '>= 6.1.6.1'

gem 'puma', '~> 3.11'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n', '~> 6.0'

gem 'active_storage_validations'
gem 'aws-sdk-s3', require: false
gem 'image_processing', '~> 1.2'
gem 'mailjet'
gem 'pundit'
gem 'resque'

gem 'omniauth'
gem 'omniauth-github', github: 'omniauth/omniauth-github', branch: 'master'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'

group :test do
  gem 'factory_bot_rails'
end
group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'sqlite3'
end

group :production do
  gem 'capistrano', '~> 3.8'
  gem 'capistrano-bundler', '~> 1.2'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-resque', '~> 0.2.3', require: false
  gem 'capistrano-yarn', '~> 2.0', '>= 2.0.2'
  gem 'pg'
end

group :development do
  gem 'letter_opener'
  gem 'web-console'
end
