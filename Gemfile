source 'http://rubygems.org'

gem 'rails', '3.1.1'

group :development do
  gem 'heroku'
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
  gem 'sqlite3'   
  gem 'geocoder'
  #gem 'pg'
end

group :production do 
  gem 'pg'
  gem 'geocoder'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer'
end

gem 'jquery-rails'

group :test, :development do
  gem 'capybara'
  gem 'rspec-rails'
end
