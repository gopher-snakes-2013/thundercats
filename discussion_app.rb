$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'
require 'shotgun'
require 'models/post'
require 'models/comment'
require 'models/user'

# This loads environment variables from the .env file
begin
require 'dotenv'
Dotenv.load

set :database, ENV['DATABASE_URL']

rescue LoadError
end

get '/' do
  render_home_page
end

get '/signup' do
  @user = User.new
  erb :signup
end

post '/create_user' do
  @user = User.create(username: params["username"], password: params["password"])
  erb :signup
end

post '/form' do
  @post = Post.create(:title => params["title"], :content => params["content"])
  if @post.valid?
    redirect '/'
  else
    render_home_page(:post => @post)
  end
end

get '/detail/:id' do
  @specific_post = Post.find(params[:id])
  @comments = @specific_post.comments
  erb :detail
end

post '/comment' do
  @comment = Comment.create(:post_id => params["post_id"], :content => params["content"])
  if @comment.valid?
    redirect "/detail/#{params['post_id']}"
  else
    render_detail_page
  end
end

# Initialize render_home_page with local variables if they
# exist otherwise create new @post and @posts
helpers do
  def render_home_page(local_variables={})
    @post = local_variables.fetch(:post, Post.new)
    @posts = local_variables.fetch(:posts, Post.all)
    erb :index
  end

  def render_detail_page
    @specific_post = Post.find(params["post_id"])
    @comments = @specific_post.comments
    @comm_errors = @comment.errors.full_messages.first
    erb :detail
  end
end
