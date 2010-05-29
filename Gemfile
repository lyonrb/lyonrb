# Edit this Gemfile to bundle your application's dependencies.
source 'http://rubygems.org'

gem "rails", "3.0.0.beta3"
gem 'warden'
gem 'devise', "1.1.rc1"
gem 'haml'
#to be uncommented when rack-offline will work out of the box
#gem 'rack-offline', :git => "http://github.com/wycats/rack-offline.git"
#gem 'rack-offline', :path => "/home/franck/development/contributions/rack-offline", :require => 'rack-offline'
# Bundle gems used only in certain environments:
group :development do
  gem "rspec", :group => :test
  gem "webrat"
  gem "sqlite3-ruby", :require => "sqlite3"
end

group :test do
  gem "rspec", :group => :test
  gem "webrat"
  gem "sqlite3-ruby", :require => "sqlite3"
end
