source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use postgres as the database for Active Record
gem 'pg', '0.15.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
#gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Twitter CSS/SASS framework
# gem 'bootstrap-sass','2.3.2.0'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass', branch: 'master'
# gem 'bootstrap-sass-rails'

# Experimental Bootstrap 3 => http://gorails.com/blog/trying-out-bootstrap-3-0
# gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
#                               :github => 'anjlab/bootstrap-rails',
#                               :branch => '3.0.0'

# Fake models beleben
gem 'faker', '1.1.2'

gem 'will_paginate', '3.0.4'

gem 'will_paginate-bootstrap'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
	gem 'rspec-rails', '2.13.1'
	gem 'therubyracer', platforms: :ruby
end

group :test do
	gem 'selenium-webdriver', '2.35.1'
	gem 'capybara', '2.1.0'
	gem 'factory_girl_rails', '4.2.1'
end

group :production do
  gem 'rails_12factor', '0.0.2'
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '3.0.1'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]