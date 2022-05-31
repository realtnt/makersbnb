# These lines load Sinatra and a helper tool to reload the server
# when we have changed the file.
require 'sinatra/base'
require 'sinatra/reloader'

# You will want to require your data model class here
require "database_connection"

class WebApplicationServer < Sinatra::Base
  # This line allows us to send HTTP Verbs like `DELETE` using forms
  use Rack::MethodOverride

  enable :sessions

  configure :development do
    # In development mode (which you will be running) this enables the tool
    # to reload the server when your code changes
    register Sinatra::Reloader

    # In development mode, connect to the development database
    db = DatabaseConnection.new("localhost", "web_application_dev")
    $global = { db: db }
  end

  configure :test do
    # In test mode, connect to the test database
    db = DatabaseConnection.new("localhost", "web_application_test")
    $global = { db: db }
  end

  def animals_table
    $global[:animals_table] ||= AnimalsTable.new($global[:db])
  end

  # Start your server using `rackup`.
  # It will sit there waiting for requests. It isn't broken!

  # YOUR CODE GOES BELOW THIS LINE

  # ...

  # EXAMPLE ROUTES

  get '/' do
    erb :sign_up
  end

  get '/login' do
    erb :log_in
  end

  get '/spaces' do
    erb :spaces
  end

  post '/spaces' do
    redirect '/spaces'
  end

  get '/spaces/new' do
    erb :spaces_new
  end

  get '/spaces/:index' do
    erb :space_details, locals: { index: params[:index] }
  end

  post '/registrations' do
    session[:user_id] = params[:email]
    redirect '/'
  end

  post '/registrations/login' do
    session[:user_id] = params[:email]
    redirect '/'
  end

  get '/sign_out' do
    session.clear
    redirect '/'
  end
end
