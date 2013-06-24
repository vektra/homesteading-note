source "http://rubygems.org"

ruby "1.9.3", :engine => "rbx", :engine_version => "2.0.0.rc1"


# homesteading shared stuff
gem "homesteading-tasks"

gem "rails",       "~> 3.2.13"
gem "bcrypt-ruby", "~> 3.0.1"
gem "jquery-rails"
gem "json"
gem "puma",        "~> 2.1.1"
gem "quiet_assets"

group :development do
  gem "taps"
  gem "gx"
end

group :assets do
  gem "sass-rails",   "~> 3.2.5"
  gem "uglifier",     "~> 1.3.0"
end

group :test, :development do
  gem "sqlite3"
  gem "rails-default-database"
  gem "rspec-rails"
  gem "fabrication"
  gem "guard-rspec"
  gem "guard-spork"
  gem "rb-fsevent"
  gem "simplecov", :require => false
end

group :production do
  gem "pg"
end
