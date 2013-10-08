require 'sinatra'
require 'thin'
require 'shotgun'

get '/' do
  "Hello, world"
end

get '/about' do
	'A little about me.'
end

