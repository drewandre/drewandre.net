source "https://rubygems.org"

ruby "2.4.2"

gem 'activerecord'
gem 'actionmailer'
gem 'activesupport'
gem 'json'
gem "pg"
gem "rake"
gem "sass"
gem "sinatra"
gem 'httparty'
gem "sinatra-activerecord"
gem "sinatra-contrib"
gem "sinatra-flash"
gem 'webpacker'

group :test, :development do
  gem "pry"
end

group :test do
  gem "rspec", "~> 3.4"
  gem "database_cleaner"
  gem "capybara"
  gem "shoulda"
  gem "shoulda-matchers", "~> 3.1", require: false
  gem "valid_attribute"
end
