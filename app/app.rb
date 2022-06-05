require './config/environment'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'bcrypt'
require 'require_all'
require_all 'app'

class WebApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  use BookingsController
  use UsersController
  use MessagesController
  use SpacesController
  use RequestsController

  enable :sessions

  configure do
    set :session_secret, ENV['SESSION_KEY'] || 'top-secret'
    set :views, "app/views"
    set :public_dir, "public"
  end
  
  configure :development do
    register Sinatra::Reloader
  end
  
  configure :test do
  end
end
