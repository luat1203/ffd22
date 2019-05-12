source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.5.3"

gem "bcrypt", "3.1.12"
gem "bootstrap"
gem "bootstrap-will_paginate"
gem "cancancan"
gem "carrierwave", "1.2.2"
gem "config"
gem "devise"
gem "faker", "1.7.3"
gem "figaro"
gem "font-awesome-rails"
gem "mini_magick", "4.7.0"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.3"
gem "rails-i18n"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "will_paginate", "3.1.7"

gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"
gem "jquery-rails", "4.3.1"
gem "rubocop", "~> 0.54.0", require: false
gem "turbolinks", "~> 5"

gem "bootsnap", ">= 1.1.0", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "sqlite3", "1.3.13"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "guard", "2.13.0"
  gem "guard-minitest", "2.4.4"
  gem "minitest", "5.10.3"
  gem "minitest-reporters", "1.1.14"
  gem "rails-controller-testing", "1.0.2"
end

group :production do
  gem "fog", "1.42"
  gem "pg", "0.20.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
