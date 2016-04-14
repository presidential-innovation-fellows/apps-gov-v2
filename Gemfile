source "https://rubygems.org"

ruby "2.2.4"

gem "airbrake",'~> 4.3'
gem "autoprefixer-rails"
gem "bourbon", "~> 4.2.0"
gem "cancancan", "~> 1.10"
gem "coffee-rails", "~> 4.1.0"
gem "delayed_job_active_record"
gem "devise", "~> 3.5.4"
gem "email_validator"
gem "flutie"
gem 'friendly_id', '~> 5.1.0'
gem "haml"
gem "high_voltage"
gem "i18n-tasks"
gem "jquery-rails"
gem "neat", "~> 1.7.0"
gem "newrelic_rpm", ">= 3.9.8"
gem "normalize-rails", "~> 3.0.0"
gem "paperclip", "~> 5.0.0.beta1"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 4.2.5"
gem "recipient_interceptor"
gem "refills"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "title"
gem "uglifier"

group :development do
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit", require: false
  gem "byebug"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.3.0"
end

group :test do
  gem "capybara-webkit", ">= 1.2.0"
  gem 'codeclimate-test-reporter', require: false
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers", require: false
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "cf-app-utils"
  gem "rack-timeout"
  gem "rails_12factor"
end
