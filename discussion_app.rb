$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'

require 'models/post'


# This loads environment variables from the .env file
require 'dotenv'
Dotenv.load

set :database, ENV['DATABASE_URL']

get '/' do
  erb :index
end

# post '/' do
#   Todo.create(:name => params["todo_name"])
#   redirect '/'
# end

# post '/complete' do
#   p Todo.find_by(:name => params["todo_name"])
#   redirect '/'
# end