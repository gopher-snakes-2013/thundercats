$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'
# require 'shotgun'
require 'models/post'
require 'models/comment'

# This loads environment variables from the .env file
begin
require 'dotenv'
Dotenv.load

set :database, ENV['DATABASE_URL']

rescue LoadError
end

get '/' do
	@posts = Post.all
  erb :index
end

post '/form' do
  Post.create(:title => params["title"], :content => params["content"])
  redirect '/'
end

get '/detail/:id' do
  @specific_post = Post.find(params[:id])
  @comments = @specific_post.comments
  erb :detail
end

post '/comment' do
  Comment.create(:post_id => params["post_id"], :content => params["content"])
  redirect "/detail/#{params['post_id']}"
end
