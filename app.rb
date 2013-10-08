require 'sinatra'

get '/' do
  "Hello, world"
end

get '/:name' do
  "Hey #{params[:name]}"
end