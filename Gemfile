source 'http://rubygems.org'

gem 'rails'

# Asset template engines
gem 'sass'
gem 'coffee-script'
gem 'uglifier'

gem 'warden'
gem 'devise', ' ~> 1.4'
gem 'cancan'

gem 'haml'
gem 'jquery-rails'
gem 'rdiscount'
gem 'nokogiri'
gem 'icalendar'

gem 'jquery-rails'

gem "zurb-foundation"

group :development do
  gem 'passenger'
end

group :test, :development do
  gem 'rspec', '2.5.0'
  gem 'rspec-rails', '2.5.0'
  gem 'capybara'
end

group :test do
  # Pretty printed test output
  gem 'database_cleaner'
  gem 'turn', :require => false
  gem 'launchy'    # So that you can save_and_open_page
  gem 'factory_girl'
  gem 'fakeweb'
  gem 'timecop'
end

group :production do
  gem 'pg', '~> 0.11'
  gem "therubyracer-heroku" #ExecJS
end

