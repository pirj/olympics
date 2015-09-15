ruby '2.2.3'
source 'https://rubygems.org'

gem 'rails', '4.2.4'
gem 'thin'

gem 'sqlite3', groups: [:development, :test]
gem 'pg', group: :production
gem 'immigrant'
gem 'enumerize'
# gem 'squeel'
gem 'aasm'

gem 'sass-rails'
gem 'coffee-rails'
gem 'autoprefixer-rails'
gem 'normalize-rails'

group :assets do
  gem 'execjs', platforms: :ruby
  gem 'uglifier', '>= 1.3.0'
end

source 'https://rails-assets.org' do
  # gem 'rails-assets-bootstrap'
  gem 'rails-assets-flickerplate'
end

gem 'jquery-rails'
gem 'turbolinks'
# gem 'jbuilder', '~> 2.0'
# gem 'sdoc', '~> 0.4.0', group: :doc

gem 'slim-rails'
gem 'formtastic'

gem 'has_scope'
gem 'draper'
gem 'responders'
# gem 'friendly_id'

gem 'refile', require: 'refile/rails'
gem "refile-input", require: 'inputs/refile_input'
gem 'refile-mini_magick'

gem 'activeadmin', github: 'activeadmin'

gem 'devise'
gem 'cancancan'
# gem 'canard'

# Translations
gem 'rails-i18n'
gem 'devise-i18n'

# Use Capistrano for deployment
group :development do
  gem 'capistrano'
  gem 'capistrano-rvm'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-thin'
  gem 'capistrano3-nginx', '~> 2.0'
end

group :development, :test do
  gem 'pry-byebug'
end

group :development do
  gem 'quiet_assets'
  gem 'rack-livereload'
  gem 'guard-shell'
  gem 'guard-livereload', require: false
  # Access an IRB console on exception pages or by using <%= console %> in views
  # gem 'web-console', '~> 2.0'
  # gem 'spring'
end

gem 'factory_girl_rails' # Factories
group :test do
  gem 'minitest-spec-rails'
  gem 'minitest-matchers_vaccine' # Non-intrusive matchers
  gem 'valid_attribute' # Sugar for attribute validity
  gem 'shoulda-matchers'

  gem 'ffaker' # Fake data
  gem 'database_rewinder' # Clean up between tests
end
