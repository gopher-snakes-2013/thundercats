$LOAD_PATH.unshift(File.expand_path('.'))
require 'capybara/rspec'
require 'discussion_app'

Capybara.app = Sinatra::Application

# RSpec.configure do |config|
#   config.before do
#     Post.destroy_all
#   end
# end