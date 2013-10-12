$LOAD_PATH.unshift(File.expand_path('.'))
require 'capybara/rspec'
require 'discussion_app'
require 'shoulda-matchers'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.before do
    Post.destroy_all
    User.destroy_all
    Comment.destroy_all
  end
end
