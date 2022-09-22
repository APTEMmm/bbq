source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

gem 'rails', '~> 6.1.6', '>= 6.1.6.1'

gem 'puma', '~> 3.11'

gem 'jbuilder', '~> 2.7'
gem 'webpacker', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'font-awesome-rails'

gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n', '~> 6.0'

gem 'aws-sdk-s3', require: false
gem 'carrierwave'
gem 'fog-aws'
gem 'rmagick'

gem 'mailjet'
gem 'letter_opener'

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
