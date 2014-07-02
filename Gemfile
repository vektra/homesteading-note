source "https://rubygems.org"

ruby "2.1.2"

# homesteading shared stuff
gem "homesteading-tasks"
gem "homesteading_helpers"

# Temporary fix
gem "sprockets", "=2.11.0"

gem "rails",     "~> 4.1.2"
gem "sass-rails"
gem "uglifier"
gem "puma"
gem "jquery-rails"
gem "quiet_assets"
gem "will_paginate"

group :test, :development do
  gem "sqlite3"
  gem "rspec-rails"
  gem "fabrication"
  gem "database_cleaner"
end

group :test do
  gem "codeclimate-test-reporter", require: nil
end

group :production do
  gem "pg"
  gem "rails_12factor"
end
