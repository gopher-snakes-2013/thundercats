source 'https://rubygems.org'
ruby "1.9.3"

gem 'sinatra'
gem 'sinatra-activerecord'


group :production, :staging do
# Bundler lets you use groups to only install gems in particular environments
# http://bundler.io/v1.3/groups.html

  gem 'pg'
  # Postgres is alternative to SQLite3 that is much better for Applications
  # being used by multiple users at the same time.

  # You should try to get postgres installed on your personal laptops soon; and
  # if you have trouble grab a TA, coach or teacher to help you install it the
  # next day.
end


group :development, :test do
# Heroku ignores development/test groups
# https://devcenter.heroku.com/articles/getting-started-with-ruby#runtime-dependencies-on-development-test-gems
  gem 'dotenv'
  gem 'sqlite3'
  gem 'shotgun'
  gem 'capybara'
  gem 'rspec'
  gem 'shoulda-matchers'
end

