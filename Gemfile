source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0.2", ">= 6.0.2.2"

group :development do
  gem "sqlite3"
end

group :production do
  gem "pg"
end
# Use Puma as the app server
gem "puma", "~> 4.1"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  gem "dotenv-rails"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "activeadmin", "2.2.0"
gem "carrierwave"
gem "carrierwave-base64"
gem "cloudinary"
gem "coffee-rails"
gem "gmaps4rails"
gem "graphiti", "~> 1.2"
gem "graphiti-rails", github: "firstdraft/graphiti-rails", branch: "develop"
gem "ideas_generators", github: "firstdraft/ideas_generators"
gem "rspec-rails"
gem "rubocop-rails", "2.5.2", require: false
gem "shoulda-matchers"
gem "sprockets", "~> 3.7"
gem "sprockets-rails", require: "sprockets/railtie"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "underscore-rails"
gem "vandal_ui", "~> 0.4"
gem "web_git", github: "firstdraft/web_git", group: :development

group :development, :test do
  gem "factory_bot_rails"
  gem "faker"
  gem "graphiti_spec_helpers"
end

group :test do
  gem "database_cleaner"
end
gem "activerecord-import"
gem "bootstrap3-datetimepicker-rails", "~> 4.17.43"
gem "bootstrap4-kaminari-views"
gem "devise-jwt", "~> 0.8.1"
gem "kaminari"
gem "momentjs-rails", ">= 2.9.0"
gem "rack-cors"
gem "ransack"
gem "rollbar"
gem "seed_dump", git: "https://github.com/firstdraft/seed_dump.git"
gem "wdm" if Gem.win_platform?
