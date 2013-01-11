source 'https://rubygems.org'

gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3'
gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'less-rails'
  gem 'coffee-rails', '~> 3.2.1'


  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'libv8'
  gem 'therubyracer', :platform => :ruby
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :deployment, :test do
  gem 'rspec-rails'
  gem 'guard-rails'
#gem 'rb-fsevent' if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-livereload'
end

group :deployment do
  gem 'capistrano'
  gem 'rvm-capistrano'
  gem 'capistrano_colors'
  gem 'capistrano-ext'
  gem 'capistrano_rsync_with_remote_cache'
end



gem 'therubyrhino'

gem 'execjs'

gem 'devise'

gem 'unicorn'

gem 'twitter-bootstrap-rails'

gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem  'twitter', '3.7.0'
group :test, :development do
  gem 'pry-rails'
  # gem 'pry-coolline', :git => 'git://github
  gem 'pry-nav'
  gem 'pry-exception_explorer'
  gem 'hirb-unicode'
end


