$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'
require 'shotgun'
require 'models/post'
require 'models/comment'
require 'models/user'

begin
require 'dotenv'
Dotenv.load

set :database, ENV['DATABASE_URL']

rescue LoadError
end

get '/' do
  @welcome_name = nil
  @new_user = User.new
  render_home_page
end

get '/signup' do
  @new_user = User.new
  erb :signup
end

post '/signup' do
  @new_user = User.create(username: params["username"], password: params["password"])
  if @new_user.valid?
    render_home_page
  else
    redirect '/'
  end
end

post '/form' do
  @new_user = User.new
  @post = Post.create(:title => params["title"], :content => params["content"])
  if @post.valid?
    redirect '/'
  else
    render_home_page(:post => @post)
  end
end

get '/detail/:id' do
  @new_user = User.new
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

post '/login' do
  @new_user = User.new
  @welcome_name = params[:username]
  render_home_page
end

helpers do
  def render_home_page(local_variables={})
    @post = local_variables.fetch(:post, Post.new)
    @posts = local_variables.fetch(:posts, Post.all)
    erb :index
  end

  def render_detail_page
    @specific_post = Post.find(params["post_id"])
    @comments = @specific_post.comments
    @comm_errors = @comment.errors.full_messages.first.downcase
    erb :detail
  end
end
