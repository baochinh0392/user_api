# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Seperate role admin and user
gem 'rolify'
# Register user and login/logout
gem 'devise'
# Check authentication
gem 'simple_token_authentication'
# Check role
gem 'cancancan'
# Code style guide
gem 'rubocop'
# write docs API
gem 'rswag'
# Dry transation
gem 'dry-transaction', '~> 0.13.0'
# Dry validation
gem 'dry-validation'
# Search in rails
gem 'ransack'
# Pagination
gem 'kaminari' 
gem 'api-pagination'
gem 'active_model_serializers'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
gem 'devise-jwt'

# GG login
gem 'omniauth', '~> 1.9', '>= 1.9.1'
gem 'google-api-client', require: 'google/apis/calendar_v3'
gem 'omniauth-google-oauth2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Unit test
  gem 'rspec-rails', '~> 4.0.1'
  # Create fake data
  gem 'factory_bot_rails'
  # Show coverage code
  gem 'simplecov', require: false
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
