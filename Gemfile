source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.5'
# Internationalization (i18n) library for Ruby
gem 'i18n'
# Flexible authentication solution for Rails with Warden.
gem 'devise'
# About Translations for the devise gem
gem 'devise-i18n'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.
gem 'faker', '~> 1.6', '>= 1.6.6'
# jquery-rails
gem 'jquery-rails'
# Use Puma as the app server
gem 'puma', '~> 5.0'
gem 'rmagick'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# The safe Markdown parser, reloaded.
gem 'redcarpet', '~> 3.3', '>= 3.3.4'

# Object oriented authorization for Rails applications
gem 'pundit'

# Integration of RubyMoney - Money with Rails
gem 'money-rails'

# FriendlyId is the “Swiss Army bulldozer” of slugging and permalink plugins for ActiveRecord. It allows you to create pretty URL’s and work with human-friendly strings as if they were numeric ids for ActiveRecord models.
gem 'friendly_id', '~> 5.4.0'

# Help ActiveRecord::Enum feature to work fine with I18n and simple_form.
gem 'enum_help'

# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Ruby webapps
gem 'kaminari'

# Translations for the kaminari gem
gem 'kaminari-i18n'

#  A Ruby Gem that wraps the functionality of jQuery Raty library, and provides optional IMDB style rating.
gem 'ratyrate'

# Use Active Storage variant
gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Generate Entity-Relationship Diagrams for Rails applications
  gem 'rails-erd'
  # Better error page for Rack apps
  gem 'better_errors'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  gem 'listen', '~> 3.3'
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Preview mail in the browser instead of sending.
  gem "letter_opener"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
