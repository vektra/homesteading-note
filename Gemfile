source "https://rubygems.org"

ruby "2.1.1"

# homesteading shared stuff
gem "homesteading-tasks"

# Temporary fix
gem "rails",     "~> 4.1.0"
gem "sprockets", "=2.11.0"
gem "sass-rails"
gem "uglifier"
gem "puma"
gem "jquery-rails"
gem "quiet_assets"
gem "will_paginate"

group :test, :development do
  gem "better_errors"
  gem "sqlite3"
  gem "rspec-rails"
  gem "fabrication"
  gem "simplecov", :require => false
end

group :production do
  gem "pg"
  gem "rails_12factor"
end
