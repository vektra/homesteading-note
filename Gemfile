source "https://rubygems.org"

gem "rails",       "~> 3.2.9"
gem "bcrypt-ruby", "~> 3.0.1"
gem "jquery-rails"
gem "json"
gem "puma"
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
