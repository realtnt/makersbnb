class UsersController < Sinatra::Base
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
  
  get '/' do
    erb :sign_up
  end

  get '/login' do
    erb :log_in
  end

  post '/registrations/login' do
    user = User.find_by(:email => params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/spaces"
    else
      redirect "/failure"
    end
  end

  post '/registrations' do
    @user = User.new(
      email: params["email"], 
      first_name: params["first_name"], 
      last_name: params["last_name"], 
      password: params["password"]
    )
    if @user.save
      session[:user_id] = @user.id
      redirect '/spaces'
    else
      redirect '/failure'
    end
  end

  get '/failure' do
    erb :failure
  end

  # post '/registrations' do
  #   session[:user_id] = 50
  #   redirect '/'
  # end

  get '/sign_out' do
    session.clear
    redirect '/'
  end
end
