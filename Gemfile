source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2 "
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'rack-cors'

group :development, :test do
  gem "pry"
  gem "pry-byebug"
  gem "pry-doc"
  gem "pry-rails"
  gem "rubocop"
  gem "factory_bot_rails"
  gem "faker"
end

group :test do
  gem "rspec-rails"
  gem "shoulda-matchers"
end



gem "devise", "~> 4.9"
