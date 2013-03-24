source 'http://rubygems.org'

ruby '1.9.3' # explicitly set ruby version, required to get mongoid to work on Heroku

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'activerecord-postgresql-adapter'
  gem 'unicorn'
  gem 'therubyracer-heroku'
end


group :development, :test do
  gem "rspec-rails", "~> 2.0"
  gem 'sqlite3'
  gem 'thin'
  gem 'binding_of_caller'
  gem "mysql2", "~> 0.3.11"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails'#, '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'wicked'
gem 'rails_admin'
gem 'validates_email_format_of', :git => 'git://github.com/alexdunae/validates_email_format_of.git'
gem 'pg'
gem 'custom_error_message' # using ^Message eg in validates_... whill exclude the attraibute name
#gem "friendly_id", "~> 4.0.9" # Note: You MUST use 4.0.9 or greater for Rails 3.2.10+
#gem "puma", ">= 1.6.3"
gem "haml-rails"#, ">= 0.4"
gem "twitter-bootstrap-rails", ">= 2.2.4", :group => :assets
gem "libv8", ">= 3.11.8"
#gem "therubyracer", ">= 0.11.3", :group => :assets, :platform => :ruby, :require => "v8"

gem 'state_machine'
gem 'jquery-rails'

gem "factory_girl_rails", ">= 4.2.0", :group => [:development, :test]
gem "simple_form", ">= 2.0.4"
gem "quiet_assets", ">= 1.0.1", :group => :development
gem "figaro", ">= 0.5.3"
gem "better_errors", ">= 0.6.0", :group => :development

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'


gem "devise"
