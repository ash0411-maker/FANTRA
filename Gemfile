source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.7'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4', '>= 5.2.4.2'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "letter_opener"
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  # gem 'chromedriver-helper'
  gem 'webdrivers','~> 3.0'
  gem 'rspec-rails'
  gem "factory_bot_rails"
  gem 'rspec-parameterized'
  gem 'faker'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#ログイン機能
gem 'devise'

#論理的退会機能
gem 'paranoia'

#Bootstrap
gem 'bootstrap-sass', '~> 3.4.1'

#jquery
gem 'jquery-rails'

#画像
gem "refile", require: "refile/rails", github: 'manfe/refile'
gem "refile-mini_magick"

#ページング
gem 'kaminari','~> 1.1.1'

#エラー発見機
gem 'pry-byebug'

#アイコン
gem 'font-awesome-sass', '~> 5.4.1'

#googlemap
gem 'geocoder'

#複数のデータを同時保存
gem 'cocoon'

#環境変数を管理
gem 'dotenv-rails'

#AWS ストレージ
gem "refile-s3"

gem 'capistrano'
gem 'capistrano-rails'
gem 'capistrano3-puma'
gem 'capistrano-rbenv'

#コントローラーテスト
gem 'rails-controller-testing'


# AWSで動作させる際にはMySQL。本番環境で利用するデータベースとしては、より堅牢で安定したMySQLを使う
group :production do
  gem 'mysql2'
end





