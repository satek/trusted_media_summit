source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
#ruby '2.5.1'
gem 'rails', '~> 5.2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

gem 'exifr'
gem 'httparty'
gem 'google-cloud-translate'
gem 'dotenv-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-rails", "~> 1.4", require: false
end
group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'slim-rails'
group :development do
  gem 'better_errors'
  gem 'foreman'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'spring-commands-rspec'
end
group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'rubocop'
end
group :test do
  gem 'database_cleaner'
  gem 'launchy'
end
