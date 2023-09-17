# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.8'

gem 'annotate', '~> 3.2'
gem 'blueprinter', '~> 0.25.3'
gem 'bootsnap', require: false
gem 'devise', '~> 4.8'
gem 'devise-jwt', '~> 0.9'
gem 'dry-monads', '~> 1.6'
gem 'oj', '~> 3.16'
gem 'pg', '~> 1.5'
gem 'cloudinary'
gem 'puma', '~> 6.3', '>= 5.6.7'
gem 'rack-cors', '~> 1.1'
gem 'rswag-api', '~> 2.10'
gem 'rswag-ui', '~> 2.10'
gem 'rubocop-rails', '~> 2.21'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 2.20'
  gem 'dotenv-rails', '~> 2.7'
  gem 'rspec-rails', '~> 6.0.0rc1'
  gem 'rswag-specs', '~> 2.10'
end
