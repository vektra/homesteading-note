source "https://rubygems.org"

ruby "1.9.3"

# homesteading shared stuff
gem "homesteading-tasks"

gem "rails",         "~> 4.0.0"
gem "sass-rails",    "~> 4.0.0"
gem "uglifier",      ">= 1.3.0"
gem "puma",          "~> 2.6.0"
gem "jquery-rails"
gem "quiet_assets"
gem "will_paginate", "~> 3.0"

group :test, :development do
  gem "better_errors"
  gem "sqlite3"
  gem "rspec-rails"
  gem "fabrication"
  gem "simplecov", :require => false
end

group :production do
  gem "pg"
end
