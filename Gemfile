source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
 gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
#gem 'unicorn'

gem 'sidekiq'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'nokogiri'

#gem 'beatport'

gem 'soundcloud'

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'pry-rails'
end

group :production, do
  gem 'rails_12factor',
  gem 'unicorn'
end
#gem "twitter-bootstrap-rails"

# for use with Chrome Rails Panel developer tool - see warnings
#If you're using LiveReload or Rack::LiveReload make sure to exclude watching
#your tmp/ folder because meta_request writes a lot of data there and your browser
#will refresh like a madman.
# group :development do
#   gem 'meta_request'
# end
