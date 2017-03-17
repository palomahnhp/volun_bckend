source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7.1'

gem 'pg', '~> 0.19.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem 'bootstrap-sass-extras'
# gem 'devise-bootstrap-views'
gem 'will_paginate-bootstrap'
gem 'will_paginate'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# gem 'bootstrap-generators'
gem 'ransack'
gem 'cancancan'
gem 'devise'
gem 'simple_form'
gem 'nested_form'
gem 'font-awesome-rails'
gem 'responders'
gem 'enum_help'
gem 'rails-i18n', '~> 4.0.0'
gem 'savon'
gem 'date_validator'


# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :preproduction, :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'quiet_assets'
  gem 'bullet'
  gem 'faker'
  gem 'database_cleaner'
  gem 'capybara' # integration testing tool for rack based web applications.
  gem 'fuubar'   # RSpec progress bar formatter
  gem 'i18n-tasks' #  helps you find and manage missing and unused translations.
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :development do
  gem 'poltergeist'
  gem 'coveralls', require: false
  gem 'email_spec'
  #  utility and framework for executing commands in parallel on multiple remote machines, via SSH.
  gem 'capistrano',         '3.5.0', require: false
  gem 'capistrano-rails',   '1.1.6', require: false
  gem 'capistrano-bundler', '1.1.4', require: false
  gem 'capistrano-rvm',              require: false
  # gem 'capistrano3-delayed-job', '~> 1.0'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

eval_gemfile './Gemfile_custom'