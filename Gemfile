# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "bootsnap", ">= 1.4.4", require: false
gem "cancancan", "~> 3.2"
gem "devise", "~> 4.7"
gem "factory_bot_rails", "~> 6.1"
gem "figaro", "~> 1.2"
gem "hotwire-rails", "~> 0.1.1"
gem "jbuilder", "~> 2.7"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.0"
gem "redis", "~> 4.2"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 5.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "ffaker", "~> 2.17"
  gem "rspec-rails", "~> 4.0"
end

group :development do
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "web-console", ">= 4.1.0"
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  # gem "rack-mini-profiler", "~> 2.0"
  gem "letter_opener", "~> 1.7"
  gem "listen", "~> 3.3"
  gem "rubocop-rails", "~> 2.9"
  gem "rubocop-rails_config", "~> 1.1"
  gem "rubocop-rspec", "~> 2.1"
  gem "spring"
end

gem "sidekiq", "~> 6.1"

gem "noticed", "~> 1.2"
