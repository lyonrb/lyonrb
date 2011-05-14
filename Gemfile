source 'http://rubygems.org'

gem 'rails',     :git => 'git://github.com/rails/rails.git'
gem 'sqlite3'

# Asset template engines
gem 'sass'
gem 'coffee-script'
gem 'uglifier'

gem 'warden'
gem 'devise', "1.1.2"
gem 'cancan'

gem 'haml'
gem 'jquery-rails'
gem 'rdiscount'
gem 'nokogiri'
gem 'icalendar'

gem 'jquery-rails'

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
  gem 'factory_girl', :git => "git://github.com/thoughtbot/factory_girl.git"
  gem 'fakeweb'
  gem 'timecop', :git => 'git://github.com/jtrupiano/timecop.git'
end

group :production do
  gem 'pg', '~> 0.11'
  gem "therubyracer-heroku" #ExecJS
end

