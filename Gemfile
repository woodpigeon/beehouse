source "http://rubygems.org"
ruby "1.9.3"

group :production do
  gem "activerecord-postgresql-adapter", "~> 0.0.1"
  gem "unicorn", "~> 4.6.2"
  gem "therubyracer-heroku", "~> 0.8.1.pre3"
end

group :development do
  gem "rspec-rails", "~> 2.13.0"
  gem "sqlite3", "~> 1.3.7"
  gem "thin", "~> 1.5.1"
  gem "binding_of_caller", "~> 0.7.1"
  gem "mysql2", "~> 0.3.11"
  gem "capybara", "~> 2.1.0"
  gem "launchy", "~> 2.2.0"
end

group :test do
  gem "rspec-rails", "~> 2.13.0"
  gem "sqlite3", "~> 1.3.7"
  gem "thin", "~> 1.5.1"
  gem "binding_of_caller", "~> 0.7.1"
  gem "mysql2", "~> 0.3.11"
  gem "capybara", "~> 2.1.0"
  gem "launchy", "~> 2.2.0"
end

group :assets do
  gem "coffee-rails", "~> 3.2.2"
  gem "uglifier", "~> 1.3.0"
end

gem "rails", "~> 3.2.12"
gem "wicked", "~> 0.6.0"
gem "rails_admin", "~> 0.4.6"
gem "validates_email_format_of", {:git=>"git://github.com/alexdunae/validates_email_format_of.git"}
gem "pg", "~> 0.14.1"
gem "custom_error_message", "~> 1.1.1"
gem "haml-rails", "~> 0.4"
gem "sass-rails", "~> 3.2.6"
gem "bootstrap-sass", "~> 2.3.1.0"
gem "libv8", "~> 3.11.8.13"
gem "state_machine", "~> 1.1.2"
gem "jquery-rails", "~> 2.2.1"
gem "factory_girl_rails", "~> 4.2.1", {:group=>[:development, :test]}
gem "simple_form", "~> 2.1.0"
gem "quiet_assets", "~> 1.0.2", {:group=>:development}
gem "figaro", "~> 0.6.3"
gem "better_errors", "~> 0.7.2", {:group=>:development}
gem "devise", "~> 2.2.3"
